class Admin::ItemsController < AdminController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    category = Category.find(params[:category_id])
    @item = Item.new(:category => category)
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      flash[:notice] = "Successfully created item."
      redirect_to admin_category_path(@item.category)
    else
      render :action => 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "Successfully updated item."
      redirect_to admin_category_path(@item.category)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed item."
    redirect_to admin_category_path(@item.category)
  end
end
