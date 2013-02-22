class UsersController < ApplicationController
  # Don't force the user to sign in to create an account
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(params[:user])
    
    if user.save
      flash[:notice] = "Thanks for signing up, #{user.first_name}. Please confirm your email and log in below."
      redirect_to log_in_path
    else
      render "new"
    end
  end
  
  def destroy
  end
  
  def join_course
    if current_user.join_course(params[:join_course][:id])
      flash[:notice] = "Joined #{Course.find(params[:join_course][:id]).display_name}"
    else
      flash[:alert] = "You're already enrolled in #{Course.find(params[:join_course][:id]).display_name}"
    end
    redirect_to root_url
  end
end
