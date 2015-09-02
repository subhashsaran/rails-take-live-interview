class InterviewController < ApplicationController
  before_filter :authenticate_user!, :only => [:new,:update,:my_interviews, :delete]

  def new
    @interview = Interview.new
  end
  
  def show
    @interview = Interview.find(params[:id])
    @questions = @interview.questions
  end
  
  def my_interviews
    @my_applied_interviews = Apply.where(:user_id => current_user.id)
    @my_own_interviews = Interview.where(:user_id => current_user.id,:is_closed => false)
  end

  def create
    @interview = Interview.parse(params[:interview],current_user.id)
    
    if @interview.save
      flash[:notice] = "You have successfully to Create the Interview: #{@interview.title}"
      params[:interview][:questions].each do |key,value|
        @question=Question.parse(value,@interview.id) if value[:content] != "" 
        if @question
          value[:answers].each do |k,v|
            @answer = Answer.parse(v,@question.id) if v[:content] != ""
          end
        end
      end
    end
    redirect_to :controller => "interview", :action => "show", :id => @interview.id
  end

  def delete
    @inprogress_interview = Interview.where("start_date <= ?",Time.zone.now.to_date)
    @interview = Interview.find(params[:id])
    
    if @interview.destroy()
      flash[:notice] = "You have successfully to delete the Interview: #{@interview.title}"
      respond_to do |format|
        format.js {
          @return_content = render_to_string(:partial => "/home/body_inprogress_interviews",:locals => {:inprogress_interview => @inprogress_interview})
        }
      end
    else
      flash[:error] = "You have error to delete the Interview: #{@interview.title}"
    end
  end

  def edit
    @interview = Interview.find(params[:id])
    @questions = @interview.questions
  end

  def update
    @interview = Interview.find(params[:interview][:id])
    @interview.update_attributes(:title => params[:interview][:title],:start_date => params[:interview][:start_date],
                                 :due_date => params[:interview][:due_date], :time_test => params[:interview][:time_test])
    
    redirect_to(:controller => "interview", :action => "show", :id => params[:interview][:id]) unless params[:interview][:questions]
    params[:interview][:questions].each do |key,value|
      if value[:id] && value[:content] != "" 
        @question = Question.update(value)
        value[:answers].each do |k,v|
          @answer = v[:id] ? Answer.update(v) : Answer.parse(v, value[:id])
        end
      elsif !value[:id] && value[:content] != "" 
        @question = Question.parse(value, @interview.id)
        if @question
          value[:answers].each do |k,v|
            @answer = Answer.parse(v, @question.id) if v[:content] != ""
          end
        end
      end
    end
    flash[:notice] = "You have successfully to update the Interview: #{@interview.title}"
    redirect_to :controller => "interview", :action => "show", :id => params[:interview][:id]
  end
  
  def close
    @interview = Interview.find(params[:id])
    @my_own_interviews = Interview.where(:user_id => current_user.id,:is_closed => false)
    @interview.update_attribute(:is_closed,true ) 
    
    flash[:notice] = "You have successfully to Close the Interview: #{@interview.title}"
      respond_to do |format|
        format.js {
          @return_content = render_to_string(:partial => "/interview/my_own_interviews",:locals => {:my_own_interviews => @my_own_interviews})
        }
      end  
  end

end
