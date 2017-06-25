class LineItemsController < ApplicationController
  def create
    if current_cart.nil?
      current_user.current_cart = current_user.carts.create(:status => "submitted")
    end

    current_cart.add_item(params[:item_id]).save
    redirect_to current_cart
  end
end
