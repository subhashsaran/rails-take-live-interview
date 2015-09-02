class QuestionController < ApplicationController

  def delete
    @question = Question.find(params[:question_id])
    @question.destroy()
  end

end
