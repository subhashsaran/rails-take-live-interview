class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :content, :question_id, :is_correct
  belongs_to :question, :class_name => 'Question', :foreign_key => 'question_id'

  scope :correct, :conditions => ["is_correct = ?", true]
  
  def self.count_answers(question_id)
    return Answer.where(:question_id => question_id).count
  end
  
  def self.correct?(params)
    answer = Answer.find(params)
    return true if answer.is_correct
  end

  def self.parse(params,question_id)
    Rails.logger.info "param on question #{params}"
    answer = Answer.new(:content => params[:content], :is_correct => params[:is_correct],:question_id => question_id)
    answer.save
  end
  
  def self.update(params)
    answer = Answer.find(params[:id])
    answer.update_attributes(:content => params[:content],:is_correct => params[:is_correct])
  end

end
