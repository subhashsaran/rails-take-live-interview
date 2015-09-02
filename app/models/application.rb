class Application < ActiveRecord::Base
  attr_accessible :description, :result_type, :result_comment
  
  belongs_to :interview
  belongs_to :user
  
  has_many :answers
  
end
