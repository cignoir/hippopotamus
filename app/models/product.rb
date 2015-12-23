class Product < ActiveRecord::Base
  belongs_to :workshop

  def processed?
    receipts.size > 0
  end

  def receipts
    Receipt.where(product_id: id)
  end

  def all_receipts
    recursive_receipts(receipts)
  end

  def recursive_receipts(work_receipts, result = [])
    work_receipts.each do |r|
      children = Receipt.where(product_id: r.material_id)
      result << children
      recursive_receipts(children, result) if children.size > 0
    end
    result.flatten
  end

  def duration
    Duration.new(sec)
  end

  def actual_amount
    amount * workshop.actual_amount
  end

  def actual_duration
    Duration.new(sec / actual_amount)
  end

  def total_actual_duration
    unless receipts.size.zero?
      total = all_receipts.map{ |receipt| receipt.material.actual_duration.total * receipt.quantity }.inject(:+)
      Duration.new(actual_duration + total)
    else
      actual_duration
    end
  end

  def tooltip
    return nil if receipts.size.zero?

    html = <<-EOS
      <div class='row'>
        <div class='col-sm-12'>材料</div>
      </div>
    EOS

    receipts.each do |receipt|
      html += '<div class="row">'
      html += "<div class='col-sm-8'>#{receipt.material.name}</div>"
      html += "<div class='col-sm-4'>#{receipt.quantity}</div>"
      html += '</div>'
    end

    html
  end
end
