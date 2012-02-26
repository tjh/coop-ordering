class Member::OrdersController < MembersController
  def index
    @orders = current_user.orders.recent_first.paginate :page => params[:page], :per_page => 5
  end

  def new
    @order = Order.new
    @vendors = Vendor.all
  end

  def create
    @order = current_user.orders.build(params[:order].merge(
      :batch => Batch.current(current_user.pickup_id)
    ))
    @vendors = Vendor.all

    if !@order.valid?
      @order.is_preview = false
      render :new
    elsif !@order.is_preview?
      @order.is_preview = true
      render :new
    else
      @order.save
      redirect_to member_orders_path
    end
  end
end
