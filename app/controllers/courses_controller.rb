class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    course = Course.new(params[:course])
    
    if course.save
      # Add the current user to the course
      course.users << current_user
      
      flash[:notice] = 'Course created!'
      redirect_to root_url
    else
      render 'index'
    end
  end

  def destroy
    
  end
end
