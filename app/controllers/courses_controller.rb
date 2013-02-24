class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    # Make letters in course numbers upper case
    params[:course][:number] = params[:course][:number].upcase
    
    course = Course.new(params[:course])
    
    unless course.course_already_exists
      if course.save
        # Add the current user to the course
        course.users << current_user
      
        flash[:notice] = 'Course created!'
      else
        flash[:alert] = 'There was a problem creating the course'
      end
    else
      flash[:alert] = 'Course already exists'
    end
    
    redirect_to root_url
  end

  def destroy
    
  end
end
