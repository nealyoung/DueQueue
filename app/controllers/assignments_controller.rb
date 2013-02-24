class AssignmentsController < ApplicationController
  def create
    assignment = Assignment.new(params[:assignment])
    
    if assignment.save
      flash[:notice] = 'Assignment created!'
      redirect_to root_url
    else
      flash[:alert] = assignment.errors.full_messages.first
      
      redirect_to root_url
    end
  end

  def destroy
    assignment = Assignment.find(params[:id])
    
    if assignment.destroy
      redirect_to root_url
    else
      
    end
  end
end
