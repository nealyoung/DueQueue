class HomeController < ApplicationController
  def index
    @course = Course.new
    @assignment = Assignment.new
    
    @user_assignments = Array.new
    User.find(session[:user_id]).courses.each do |course|
      course.assignments.each do |assignment|
        @user_assignments << assignment
      end
    end
  end
end
