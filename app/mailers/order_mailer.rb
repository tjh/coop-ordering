class OrderMailer < ActionMailer::Base
  if Rails.env.development?
    default from: 'tim@theharveys.org'
  else
    default from: Manager.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def new_order(order)
    @order = order

    mail(
      to:      order.user.email,
      subject: 'Fry Farms Coop Order Received'
    )
  end
end
