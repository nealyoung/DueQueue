class User < ActiveRecord::Base
  has_secure_password
  
  has_and_belongs_to_many :courses
  
  attr_accessible :email, :password, :password_confirmation
  validates_presence_of :email
  validates_uniqueness_of :email
end
