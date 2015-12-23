class HomeController < ApplicationController
  before_filter :set_request_filter

  def set_request_filter
    Thread.current[:request] = request
  end

  def index
    @takibi = [1, params[:takibi].to_i].max
    @daiku = [1, params[:daiku].to_i].max

    @products = Product.all.to_a.sort_by(&:total_actual_duration).reverse
  end
end