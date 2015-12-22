class Product < ActiveRecord::Base
  belongs_to :workshop

  def receipts
    Receipt.where(product_id: id)
  end

  def actual_amount
    amount * workshop.actual_amount
  end

  def actual_duration
    duration / actual_amount
  end

  def total_duration
    unless receipts.size.zero?
      receipts.map{ |receipt| receipt.material.actual_duration * receipt.quantity }.inject(:+)
    else
      self.actual_duration
    end
  end
end
