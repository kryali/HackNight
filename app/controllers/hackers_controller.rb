class HackersController < ApplicationController
  def index
    @hackers = Hacker.all
    current_hacker
  end

  def show
  end

  def edit
  end


  # This receives a post request and adds the hacker to our database if we don't have is email
  # (Email is unique)
  def create
    hackers = Hacker.where( :email => params[:email] )
    if hackers.empty?
      @hacker = Hacker.new({
        name=> params[:name],
        email=> params[:email],
        access_token=> params[:access_token],
        image_url=> params[:image_url],
        fb_id=> params[:fb_id]
      })
      if @hacker.save
        session[:user_id] = @hacker.id
        current_hacker = @hacker
        #render :text =>  "Added Hacker: " + @hacker.id.to_s + " Session: " + session[:user_id].to_s
      else
        render :text => @hacker.errors.full_messages
      end
    else
        session[:user_id] = hackers[0].id
        current_hacker = hackers[0]
        current_hacker.access_token = params[:access_token]
        current_hacker.save
        redirect_to index_path
        #render :text => session[:user_id].to_s
        #session[:user_id] = hackers[0].id
#        render :text =>  "Already have the hacker, Session: " + session[:user_id].to_s
    end
  end

  def check_hacknights
   @hacker = Hacker.find(params[:id])
   graph = Koala::Facebook::GraphAPI.new(@hacker.access_token)
   str = ""
   Hacknight.all.each do |night|
     attendees = graph.get_connections(night.event_id, "attending")
     attendees.each do |attendee|
       if @hacker.fb_id == attendee['id']
        night.hackers << @hacker
        render :text => "You attended Hack Night " + night.event_id
       end
     end
   end
#    render :text => #    render :text => session[:user_id]#current_hacker
    return
  end
end
