class Assignment < ActiveRecord::Base
  belongs_to :course
  
  attr_accessible :course_id, :due, :notes, :title
  
  validates_presence_of :title
  validates_presence_of :due
  validates_presence_of :course_id
end
