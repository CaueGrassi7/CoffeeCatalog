class HomeController < ApplicationController
  def index
    @coffees = Coffee.all
  end
end
