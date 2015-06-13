class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  	@item = Item.new
  end

  def create
    #formから投げられたでーたをうけとる
    @item = Item.new(item_params)

    #これをほぞんする
    @item.save

    #show.html.erb に飛ばす
    redirect_to "/items/#{@item.id}"
  end

  private

  def item_params
    # pramams.require(:key).permit(filter)
    params.require(:item).permit(
      :name,
      :price,
      :seller_id,
      :description,
      :email,
      :image_url
      )
  end
end
