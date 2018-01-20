# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Fork & Clone repository 
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Final Project
- Home page:
![Screenshot of Homepage](https://github.com/margaritawang/jungle-rails/blob/master/public/docs/Screenshot%20from%202018-01-20%2014-21-57.png)

- Product Details:
![Screenshot of Product Page with Reviews](https://github.com/margaritawang/jungle-rails/blob/master/public/docs/Screenshot%20from%202018-01-20%2014-23-09.png)

- Empty Cart:
![Screenshot of Empty Cart](https://github.com/margaritawang/jungle-rails/blob/master/public/docs/Screenshot%20from%202018-01-20%2014-24-06.png)

- Admin Category Page:
![Screenshot of Admin Category Page](https://github.com/margaritawang/jungle-rails/blob/master/public/docs/Screenshot%20from%202018-01-20%2014-25-08.png)

- Orders:
![Screenshot of Orders](https://github.com/margaritawang/jungle-rails/blob/master/public/docs/Screenshot%20from%202018-01-20%2014-37-29.png)

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt
