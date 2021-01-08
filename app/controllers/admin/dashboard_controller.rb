class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']
  def show
    @count_product = Product.all.count
    @count_categories = Category.all.count
  end
end
