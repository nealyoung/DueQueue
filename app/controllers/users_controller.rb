class UsersController < ApplicationController
  layout :resolve_layout
  
  # Don't force the user to sign in to create an account
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      flash[:notice] = "Thanks for signing up, #{@user.first_name}. Please click the link in the confirmation message sent to your inbox, and log in below."
      redirect_to log_in_path
    else
      render "new"
    end
  end
  
  def destroy
    user = User.find(params[:id])
    
    user.destroy
  end
  
  def join_course
    if params[:join_course]
      if current_user.join_course(params[:join_course][:id])
        flash[:notice] = "Joined #{Course.find(params[:join_course][:id]).display_name}!"
      else
        flash[:alert] = "You're already enrolled in #{Course.find(params[:join_course][:id]).display_name}"
      end
    else
      flash[:alert] = 'You must select a course to join. If no courses are listed, you can create a new course.'
    end
    
    redirect_to root_url
  end
  
  def leave_course
    if params[:id]
      if current_user.leave_course(params[:id])
        flash[:notice] = "Left #{Course.find(params[:id]).display_name}!"
      else
        flash[:alert] = "You're not enrolled in #{Course.find(params[:id]).display_name}"
      end
    else
      flash[:alert] = 'You must select a course to leave.'
    end
    
    redirect_to settings_path
  end
  
  def complete_assignment
    if params[:completed]
      if current_user.complete_assignment(params[:id])
        flash[:notice] = 'Assignment completed!'
      else
        flash[:alert] = 'There was an error marking the assignment as completed'
      end
    else
      current_user.assignments.delete Assignment.find(params[:id])
    end
    
    redirect_to root_url
  end
  
  def settings
    @user = current_user
    @user_courses = current_user.courses
  end
  
private
 def resolve_layout
   case action_name
   when "new"
     "sessions"
   else
     "application"
   end
 end
end
