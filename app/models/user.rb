class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :tasks

  validates_presence_of :email, message: "no email"
  validates_presence_of :name, message: "no name entered"
  validates_length_of :name, in: 3..20, message: "name must be between 3 and 20 characters"
end
