class HackersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
    if Hacker.where( :email => params[:email] ).empty?
      @hacker = Hacker.new({
        name: params[:name],
        email: params[:email],
        access_token: params[:access_token],
        image_url: params[:image_url]
      })
      if @hacker.save
        render :text =>  "Added Hacker: " + @hacker.id.to_s
      else
        render :text => @hacker.errors.full_messages
      end
    else
        render :text =>  "Already have the hacker"
    end
  end
end
