class HomeController < ApplicationController
  def index
    @course = Course.new
    @user = current_user
    @user_courses = current_user.courses
    @assignment = Assignment.new
  end
end
