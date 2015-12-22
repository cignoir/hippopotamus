class Product < ActiveRecord::Base
  belongs_to :workshop

  def materials
    Receipt.where(product_id: id)
  end
end
