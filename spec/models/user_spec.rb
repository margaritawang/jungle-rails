require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it "should be valid if all values are entered correctly" do
      user = User.new(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(user).to(be_valid)
    end

    it "should not be valid without a password" do
      user = User.new(email: 'a@b', first_name: 'a', last_name: 'a')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Password can't be blank"))
    end
  
    it "should not be valid without an email" do
      user = User.new(first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Email can't be blank"))
    end
  
    it "should not be valid without a unique email" do
      user1 = User.create(email: 'a@a', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      user2 = User.create(email: 'a@A', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(user2).to_not(be_valid)
      expect(user2.errors.full_messages).to(include("Email has already been taken"))
    end

    it "should not be valid without a first name" do
      user = User.new(email: 'a@b', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("First name can't be blank"))
    end

    it "should not be valid without a last name" do
      user = User.new(email: 'a@b', first_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Last name can't be blank"))
    end

    it "should not be valid with a password shorter than 8 characters" do
      user = User.new(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hello', password_confirmation: 'hello')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Password is too short (minimum is 8 characters)"))
    end

    it "should not be valid with a password mismatch" do
      user = User.new(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'helloworld')
      expect(user).to_not(be_valid)
      expect(user.errors.full_messages).to(include("Password confirmation doesn't match Password"))
    end
  end

  describe '.authenticate_with_credentials' do
    it "should return true if email and password match" do
      user = User.create(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(User.authenticate_with_credentials('a@b', 'hellothere')).to be_truthy
    end

    it "should return true if email includes spaces" do
      user = User.create(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(User.authenticate_with_credentials(' a@b', 'hellothere')).to be_truthy
    end
    
    it "should return true for emails with the wrong case" do
      user = User.create(email: 'a@B', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(User.authenticate_with_credentials('a@b', 'hellothere')).to be_truthy
    end

    it "should return false if email and password do not match" do
      user = User.create(email: 'a@b', first_name: 'a', last_name: 'a', password: 'hellothere', password_confirmation: 'hellothere')
      expect(User.authenticate_with_credentials('a@b', 'hello')).to be_falsy
      puts user.errors.full_messages
    end
  end
end
