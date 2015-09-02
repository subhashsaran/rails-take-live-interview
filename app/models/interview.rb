class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  validates :title, :presence => true
  validates :start_date, :presence => true
  validates :due_date, :presence => true
  
  belongs_to :author, :class_name => 'User', :foreign_key => 'user_id'
  has_many  :questions
  has_many :applies
  attr_accessible :title, :time_test, :start_date, :due_date, :user_id
  
  def self.parse(params,user_id)
     interview = Interview.new(:title => params[:title],:start_date => params[:start_date],:user_id => user_id,
                               :due_date => params[:due_date], :time_test => params[:time_test])
     interview.save
     return interview
  end

end
