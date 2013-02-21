class AssignmentsController < ApplicationController
  def create
    assignment = Assignment.new(params[:assignment])
    
    if assignment.save
      flash[:notice] = 'Assignment created!'
      redirect_to root_url
    else
      render root_url
    end
  end

  def destroy
  end
end
