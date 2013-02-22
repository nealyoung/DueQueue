class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    course = Course.new(params[:course])
    
    unless course.course_already_exists
      if course.save
        # Add the current user to the course
        course.users << current_user
      
        flash[:notice] = 'Course created!'
      else
        flash[:notice] = 'There was a problem creating the course'
      end
    else
      flash[:alert] = 'Course already exists'
    end
    
    redirect_to root_url
  end

  def destroy
    
  end
end
