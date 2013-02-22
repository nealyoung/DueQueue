class HomeController < ApplicationController
  def index
    @course = Course.new
    @assignment = Assignment.new
    
    @courses = Course.all :order => :department
    
    # Get all assignments belonging to the current user
    @user_assignments = Array.new
    
    User.find(session[:user_id]).courses.each do |course|
      course.assignments.each do |assignment|
        @user_assignments << assignment
      end
    end
        
    if params[:sort] == "course"
      @user_assignments.sort! { |a,b| a.course <=> b.course }
    else
      @user_assignments.sort! { |a,b| a.due <=> b.due }
    end
  end
end
