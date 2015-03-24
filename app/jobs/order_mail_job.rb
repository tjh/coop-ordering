class OrderMailJob
  include SuckerPunch::Job

  def perform(order_id)
    ActiveRecord::Base.connection_pool.with_connection do
      order = Order.find_by_id order_id

      order && OrderMailer.new_order(order).deliver
    end
  end
end
