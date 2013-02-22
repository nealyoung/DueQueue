class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments
  
  attr_accessible :department, :number
  
  validates_presence_of :department
  validates_presence_of :number
  
  def course_already_exists
    if Course.where("department=? AND number=?", department, number).any?
      return true
    end
    
    return false
  end
  
  def display_name
    department + ' ' + number
  end
end
