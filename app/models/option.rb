class Option < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :is_correct
  
  belongs_to :user
  belongs_to :question, :class_name => 'Question', :foreign_key => 'question_id'

end
