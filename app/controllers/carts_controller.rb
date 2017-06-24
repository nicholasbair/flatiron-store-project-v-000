class CartsController < ApplicationController
  before_action :set_cart

  def show
  end

  def checkout
    @cart.line_items.each do |line_item|
      line_item.item.update_inventory(line_item.quantity)
    end

    current_user.current_cart = nil
    redirect_to @cart
  end

  private

    def set_cart
      @cart = Cart.find_by(:id => params[:id])
    end

end
