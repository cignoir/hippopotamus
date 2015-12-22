class Workshop < ActiveRecord::Base
  def actual_amount
    [1, rank * amount_up].max
  end
end
