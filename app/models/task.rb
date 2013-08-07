class Task < ActiveRecord::Base
  attr_accessible :title, :urgency, :user_id

  validates_presence_of :title, message: "you must enter a title for your task"
  validates_length_of :title, in: 3..20, message: "must be between 3 and 20 characters"
  validates_inclusion_of :urgency, in: 1..5, message: "urgency must be between 1 and 5"
  
  belongs_to :user

  scope :priority, where("urgency > 3")
end
