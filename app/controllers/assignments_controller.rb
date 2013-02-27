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
      flash[:alert] = 'There was an error deleting the assignment'
    end
  end
  
  def report
    logger.info(params[:id] + 'Reported at ' + Time.now.to_s)
    
    flash[:notice] = 'Assignment Reported!'
    redirect_to root_url
  end
end
