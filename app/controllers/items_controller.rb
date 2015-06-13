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

  def edit
    #http://localhost:3000/items/5/edit
    #上のURLの５を取得して、@item = Item.find(5)
    @item = Item.find(params[:id])
  end

  def update
    #:idでItem.find 旧データよみだし
    @item = Item.find(params[:id])

    #新しいデータをupdate_attributeメソッドで上書き保存
    @item.update_attributes(item_params)

    #showにリダイレクトしてる。
    #そのための設定はrouteにある
    redirect_to "/items/#{@item.id}"

  end

  private
#これより下はViewとかから参照できなくなる　プライベードは
#例外時です

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
