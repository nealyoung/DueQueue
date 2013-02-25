class User < ActiveRecord::Base
  has_secure_password
  
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :assignments
  
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  
  # Associate a user with a course, unless they are already associated
  def join_course(id)
    course = Course.find(id)
    
    unless courses.include? course
      courses << course
      return true
    end
    
    return false
  end
  
  # Disassociate a user with a course
  def leave_course(id)
    course = Course.find(id)
    
    if courses.include? course
      courses.destroy course
      return true
    end
    
    return false
  end
  
  # Mark an assignment as completed for the user
  def complete_assignment(id)
    assignment = Assignment.find(id)
    
    unless assignments.include? assignment
      assignments << assignment
      return true
    end
    
    return false
  end
  
  # Check if a user has completed an assignment
  def completed_assignment?(id)
    assignment = Assignment.find(id)
    
    if assignments.include? assignment
      return true
    end
    
    return false
  end
end
