class Receipt < ActiveRecord::Base
  belongs_to :product
  belongs_to :material, class_name: 'Product'
end
