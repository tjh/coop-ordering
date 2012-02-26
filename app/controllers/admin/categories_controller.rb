class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    vendor = Vendor.find(params[:vendor_id])
    @category = Category.new(:vendor => vendor)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to admin_vendor_path(@category.vendor), :notice => 'Category was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to admin_vendor_path(@category.vendor), :notice => 'Category was successfully updated.'
    else
      render :action => "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_vendor_path(@category.vendor)
  end
end
