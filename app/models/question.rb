class Question < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :solution, :question_type,:interview_id,:user_id

  belongs_to :user
  belongs_to :interview, :class_name => 'Interview', :foreign_key => 'interview_id'

  has_many :options
  has_many :answers
  #after_save :new_answer

  def self.count_questions(interview_id)
    return Question.where(:interview_id => interview_id).count
  end
    
  def self.parse(params,interview_id)
    @question = Question.new(:content => params[:content],:question_type => params[:question_type],:interview_id => interview_id)
    @question.save
    return @question
  end
  
  def self.update(params)
    @question = Question.find(params[:id])
    @question.update_attribute(:content,params[:content])
  end

end
