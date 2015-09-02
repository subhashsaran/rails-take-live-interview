class Apply < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :interview, :class_name => 'Interview', :foreign_key => 'interview_id'
  
  attr_accessible :interview_id , :user_id, :answer_true, :time_test
  
  def self.count_applied(interview_id)
    return Apply.where(:interview_id => interview_id).count
  end
  
  def self.is_applied(interview_id,user_id)
    @interview_applied = Apply.where(:user_id => user_id)
    @id_interview_applied = @interview_applied.collect{|id_applied| id_applied.interview_id}
    return true if @id_interview_applied != [] && @id_interview_applied.include?(interview_id)  
  end

end
