class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :current_carts
  has_many :line_items
  has_many :items, through: :line_items

  enum status: [:submitted, :current]

  def total
    line_items.collect { |line_item| line_item.item.price * line_item.quantity }.sum
  end

  def add_item(id)
    if li = self.line_items.find { |line_item| line_item.item_id == id.to_i }
      li.quantity += 1
      li
    else
      self.line_items.build(:item_id => id)
    end
  end
end
