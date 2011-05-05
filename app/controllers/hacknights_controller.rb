class HacknightsController < ApplicationController
  def new
    @hacknight = Hacknight.new
  end

  def index
    @hacknights = Hacknight.all
  end

  def create
    @hacknight = Hacknight.new(params[:hacknight])
    if @hacknight.save
        redirect_to(@hacknight, :notice => 'Hacknight was created successfully')
    else
        flash[:errors] = @hacknight.errors.full_messages
        render :action => "new"
    end
  end

  def edit
    @hacknight = Hacknight.find(params[:id])
  end

  def show
    @hacknight = Hacknight.find(params[:id])
    @projects = @hacknight.projects
    @sponsors = @hacknight.sponsors
  end

  def add_hacker
    @hacknight = Hacknight.find(params[:hacknight][:id])
    if params[:hacker]
      @hacker = Hacker.find(params[:hacker][:id]) 
      @hacknight.hackers << @hacker
    end

    if @hacknight.save
      redirect_to(@hacknight, :notice => "Hacker was added!")
    else
      flash[:errors] = @hacknight.errors.full_messages
    end
  end

  def update
    @hacknight = Hacknight.find(params[:id])
    if(@hacknight.update_attributes(params[:hacknight]))
      redirect_to(@hacknight)
    else
      redirect_to(edit_hacknight_path(@hacknight))
    end
  end

  def destroy
    Hacknight.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

end
