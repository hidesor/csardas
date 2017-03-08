class Admin::TypesController < ApplicationController
    layout 'admin'
    before_action :authenticate_user!
    before_action :admin_required
    def index
        @types = Type.all
    end

    def new
        @type = Type.new
        @photo = @type.build_photo
    end

    def edit
      @type = Type.find(params[:id])
      if @type.photo.present?
        @photo = @type.photo
      else
        @photo = @type.build_photo
      end
    end

    def update
      @type = Type.find(params[:id])

      if @type.update(type_params)
        redirect_to admin_types_path
      else
        render :edit
      end
    end

    def create
      @type = Type.new(type_params)
      if @type.save
        redirect_to admin_types_path
      else
        render :new
      end
    end

    private

    def type_params
      params.require(:type).permit(:name, :description, :order,photo_attributes: [:image, :id])
    end
end
