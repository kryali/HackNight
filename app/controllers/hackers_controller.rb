class HackersController < ApplicationController
  def index
    @hackers = Hacker.all
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
        name: params[:name],
        email: params[:email],
        access_token: params[:access_token],
        image_url: params[:image_url],
        fb_id: params[:fb_id]
      })
      if @hacker.save
        current_hacker = @hacker
        session[:user_id] = @hacker.id
        redirect_to index_path
        #render :text =>  "Added Hacker: " + @hacker.id.to_s + " Session: " + session[:user_id].to_s
      else
        #render :text => @hacker.errors.full_messages
      end
    else
        session[:user_id] = hackers[0].id
        redirect_to index_path
        #render :text =>  "Already have the hacker"
    end
  end

  def check_hacknights
    render :text => session[:user_id]#current_hacker
  end
end
