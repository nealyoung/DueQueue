require 'net/http'
require 'uri'

class HomeController < ApplicationController
  def index
    @course = Course.new
    @assignment = Assignment.new
    @courses = Course.all
    @user_courses = current_user.courses
    
    # Alphabetically sort the lists of courses
    @courses.sort! { |a,b| a.display_name <=> b.display_name }
    @user_courses.sort! { |a,b| a.display_name <=> b.display_name }
    
    # Get all assignments belonging to the current user that are not marked as completed
    @user_assignments = Array.new
    
    # Add assignments unless they have been completed
    current_user.courses.each do |course|
      course.assignments.each do |assignment|
        @user_assignments << assignment unless current_user.assignments.include? assignment
      end
    end
    
    # Get all completed assignments
    @completed_assignments = Array.new
    
    current_user.assignments.each do |assignment|
      @completed_assignments << assignment
    end
    
    # Sort the user's assignments
    if params[:sort] == 'course'
      session[:sort] = :course
    elsif params[:sort] == 'due'
      session[:sort] = :due
    end
    
    if session[:sort] == :course
      @user_assignments.sort! { |a,b| a.course <=> b.course }
      @completed_assignments.sort! { |a,b| a.course <=> b.course }
    else
      @user_assignments.sort! { |a,b| a.due <=> b.due }
      @completed_assignments.sort! { |a,b| a.due <=> b.due }
    end
    
    # Determine which type of outline each unfinished assignment will have
    @assignment_outlines = Hash.new
    
    # Time differences in days
    @user_assignments.each do |assignment|
      if (assignment.due.to_datetime - DateTime.now) < 1
        @assignment_outlines[assignment.id] = :outline1
      elsif (assignment.due.to_datetime - DateTime.now) < 2
        @assignment_outlines[assignment.id] = :outline2
      elsif (assignment.due.to_datetime - DateTime.now) < 4
        @assignment_outlines[assignment.id] = :outline3
      else
        @assignment_outlines[assignment.id] = :outline4
      end
    end
    
    # Fetch list of departments from Schedule of Classes
    @departments = get_departments
  end
  
private
  def get_departments
    def open(url)
      Net::HTTP.get(URI.parse(url))
    end

    url = 'http://websoc.reg.uci.edu/perl/WebSoc'
    regex = /">([^ .]{2,9}) \. \. \. \.*/

    content = open(url)
    matches = regex.match content
    departments = Array.new

    # Array of matches
    departments = content.scan(regex)
  end
end
