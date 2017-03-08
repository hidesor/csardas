class TypesController < ApplicationController
  def index
    @types = Type.all
  end
  def show
    @type = Type.find(params[:id])
    @products = @type.product
  end
end
