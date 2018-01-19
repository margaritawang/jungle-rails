class UserMailer < ApplicationMailer
  default from: 'noreply@jungle.com'
 
  def order_email(order)
    @order = order

    mail(to: 'amywang1994@gmail.com', subject: "Order#{@order.id}: New Order from Jungle!") do |format|
      format.html
    end
  end
end
