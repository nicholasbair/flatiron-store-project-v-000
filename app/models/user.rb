class User < ActiveRecord::Base
  has_many :carts
  has_one :current_cart

  devise :database_authenticatable, :validatable, :registerable

  def current_cart=(cart)
    if cart.nil? && current_cart
      CurrentCarts.destroy(current_cart.id)
    elsif !cart.nil?
      CurrentCarts.create(:user_id => self.id, :cart_id => cart.id)
    end
  end

  def current_cart
    cart_id = CurrentCarts.where(:user_id => self.id).first
    Cart.find_by(:id => cart_id)
  end
end
