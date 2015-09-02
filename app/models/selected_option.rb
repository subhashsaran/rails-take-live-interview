class SelectedOption < ActiveRecord::Base
  attr_accessible :answer_id, :option_id, :user_id

  belongs_to :option
  belongs_to :answer
  belongs_to :user
  
end
