class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Pharmabook] 感谢您完成本次的下单，以下为您本次购物明细 #{order.token}")
  end

end