class Admin::ProductsController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :admin_required
    def index
        #@products = Product.all
        @products = Product.all.order("id DESC").paginate(:page => params[:page], :per_page => 10)
    end

    def new
        @product = Product.new
        @photo = @product.build_photo
        @type = @product.type
    end

    def edit
        @product = Product.find(params[:id])
        @type = @product.photo
        @photo = if @product.photo.present?
                     @product.photo
                 else
                     @product.build_photo
                 end
    end

    def update
        @product = Product.find(params[:id])

        if @product.update(product_params)
            redirect_to admin_products_path
        else
            render :edit
        end
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to admin_products_path
        else
            render :new
        end
    end

    private

    def product_params
        params.require(:product).permit(:title, :description, :quantity,:type_id, :price, photo_attributes: [:image, :id])
    end
end
