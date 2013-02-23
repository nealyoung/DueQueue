class Assignment < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :users
  
  attr_accessible :course_id, :due, :notes, :title
  
  validates_presence_of :title
  validates_presence_of :due, :message => 'date can\'t be blank'
  validates_presence_of :course_id
end
