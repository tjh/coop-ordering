class Admin::VendorsController < AdminController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def create
    @vendor = Vendor.new(params[:vendor])

    if @vendor.save
      redirect_to(admin_vendors_path, :notice => 'Vendor was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update_attributes(params[:vendor])
      redirect_to(admin_vendors_path, :notice => 'Vendor was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to(admin_vendors_path)
  end
end
