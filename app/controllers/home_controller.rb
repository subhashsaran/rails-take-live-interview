class HomeController < ApplicationController

  def index
    @inprogress_interview = Interview.where("start_date <= ? AND is_closed = ?",Time.zone.now.to_date,false)
    @next_interview = Interview.where("start_date > ? AND is_closed = ?" ,Time.zone.now.to_date,false)
  end
 
end
