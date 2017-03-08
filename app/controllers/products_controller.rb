class ProductsController < ApplicationController
  def index
    @types = Type.all.order('created_at DESC')
    #@products = Product.where(:type_id=>2)
    @products = Product.all
  end


  def show
    @product = Product.find(params[:id])
  end

  def type_by
    @type = Type.find(1)
    @product = @type.product
    #@products = Type.product
    #@products = Product.where(:type_id => params[:id])
    #@products = Product.where(:type_id=>2)
  end

  def add_to_cart
    @product = Product.find(params[:id])

  if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
   else
     flash[:warning] = "你的購物車內已有此物品"
   end
   redirect_to :back
  end
end
