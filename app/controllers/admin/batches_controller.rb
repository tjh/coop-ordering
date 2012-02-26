class Admin::BatchesController < AdminController
  def index
    @batches = Batch.all.paginate :page => params[:page]
  end

  def show
    @batch = Batch.find(params[:id])
    @vendors = Vendor.all
  end

  def new
    @batch = Batch.new(:deadline => 7.days.from_now)
  end

  def create
    @batch = Batch.new(params[:batch])
    if @batch.save
      flash[:notice] = "Successfully added a new order batch"
      redirect_to admin_batches_path
    else
      render :new
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    @batch = Batch.find(params[:id])
    if @batch.update_attributes params[:batch]
      flash[:notice] = "Successfully updated order batch"
      redirect_to admin_batches_path
    else
      render :edit
    end
  end

  def destroy
    @batch = Batch.find(params[:id])
    if @batch.orders.size == 0 && @batch.destroy
      flash[:notice] = "Successfully deleted order batch"
    else
      flash[:error] = "Could not delete that batch"
    end
    redirect_to admin_batches_path
  end
end
