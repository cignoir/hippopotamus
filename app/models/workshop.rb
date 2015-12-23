class Workshop < ActiveRecord::Base
  def actual_amount
    [1, request_rank * amount_up].max
  end

  def request_rank
    request = Thread.current[:request]
    if takibi?
      [rank, request.params[:takibi].to_i].max
    elsif daiku?
      [rank, request.params[:daiku].to_i].max
    else
      rank
    end
  end

  def takibi?
    id == 2
  end

  def daiku?
    id == 5
  end
end
