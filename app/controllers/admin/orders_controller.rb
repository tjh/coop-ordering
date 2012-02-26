class Admin::OrdersController < AdminController
  def index
    @orders = Order.by_user_name.where(:batch_id => params[:batch_id])
    render :layout => false
  end
end
