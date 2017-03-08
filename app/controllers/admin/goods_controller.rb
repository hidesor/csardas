class Admin::GoodsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required
  def index
    @goods = Good.all
  end
  def new
      @good = Good.new
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])

    if @good.update(good_params)
      redirect_to admin_goods_path
    else
      render :edit
    end
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to admin_goods_path
    else
      render :new
    end
  end
  private

  def good_params
    params.require(:good).permit(:title, :description, :url)
    #params.require(:type).permit(:name, :description, :order,photo_attributes: [:image, :id])
  end
end
