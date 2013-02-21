class HomeController < ApplicationController
  def index
    @course = Course.new
  end
end
