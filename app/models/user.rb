class User < ActiveRecord::Base
  has_many :carts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :validatable, :registerable
  # We should not need these
  # :recoverable, :rememberable, :trackable,

  def current_cart=(cart)
    self.current_cart_id = cart&.id
  end

  def current_cart
    Cart.find_by(:id => self.current_cart_id)
  end
end
