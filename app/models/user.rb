class User < ActiveRecord::Base
  has_secure_password
  
  has_and_belongs_to_many :courses
  
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :email
  validates_uniqueness_of :email
  
  # Associate a user with a course, unless they are already associated
  def join_course(id)
    course = Course.find(id)
    unless courses.include? course
      courses << Course.find(id)
    end
  end
end
