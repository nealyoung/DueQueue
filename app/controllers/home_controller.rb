class HomeController < ApplicationController
  def index
    @course = Course.new
    @assignment = Assignment.new
    @courses = Course.all
    @user_courses = current_user.courses
    
    # Alphabetically sort the lists of courses
    @courses.sort! { |a,b| a.display_name <=> b.display_name }
    @user_courses.sort! { |a,b| a.display_name <=> b.display_name }
    
    # Get all assignments belonging to the current user
    @user_assignments = Array.new
    
    User.find(session[:user_id]).courses.each do |course|
      course.assignments.each do |assignment|
        @user_assignments << assignment
      end
    end
    
    # Sort the user's assignments
    if params[:sort] == "course"
      session[:sort] = :course
    end
    
    if session[:sort] == :course
      @user_assignments.sort! { |a,b| a.course <=> b.course }
    else
      @user_assignments.sort! { |a,b| a.due <=> b.due }
    end
    
    # Determine which type of outline each assignment will have
    @assignment_outlines = Hash.new
    
    @user_assignments.each do |assignment|
      if current_user.assignments.include? assignment
        @assignment_outlines[assignment.id] = :outline5
      elsif (assignment.due.to_datetime - DateTime.now) < 1
        @assignment_outlines[assignment.id] = :outline1
      elsif (assignment.due.to_datetime - DateTime.now) < 2
        @assignment_outlines[assignment.id] = :outline2
      elsif (assignment.due.to_datetime - DateTime.now) < 4
        @assignment_outlines[assignment.id] = :outline3
      else
        @assignment_outlines[assignment.id] = :outline4
      end
    end
  end
end
