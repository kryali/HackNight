class SponsorsController < ApplicationController

  def new
    @sponsor = Sponsor.new
  end

  def index
    @sponsors = Sponsor.all
  end

  def create
    @sponsor = Sponsor.new(params[:sponsor])
    if @sponsor.save
      redirect_to(@sponsor) 
      #redirect_to :action => 'show', :id => @sponsor.id
    else
      flash[:errors] = @sponsor.errors.full_messages
      render :action => "new"
    end
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def show
    @sponsor = Sponsor.find(params[:id])
    @hacknights = Hacknight.all
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if(@sponsor.update_attributes(params[:sponsor]))
      redirect_to(@sponsor)
    else
      redirect_to(edit_sponsor_path(@sponsor))
    end
  end

  def destroy
    Sponsor.find(params[:id]).destroy
    redirect_to :action => 'index'
  end

end
