class Task < ActiveRecord::Base
  attr_accessible :title

  validates_presence_of :title, message: "you must enter a title for your task"
  validates_length_of :title, in: 3..20, message: "must be between 1 and 10 characters"
end
