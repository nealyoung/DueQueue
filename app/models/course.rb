class Course < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :assignments
  
  attr_accessible :department, :number
  
  def display_name
    return department + ' ' + number
  end
end
