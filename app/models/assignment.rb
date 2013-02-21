class Assignment < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :course_id, :due, :notes, :title
end
