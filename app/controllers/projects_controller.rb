class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
        redirect_to(@project, :notice => 'Project was created successfully')
    else
        flash[:errors] = @project.errors.full_messages
        render :action => "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def show
    @project = Project.find(params[:id])
    @hackers = Hacker.all
  end

  def add_hacker
    @project = Project.find(params[:project][:id])
    if params[:hacker]
      @hacker = Hacker.find(params[:hacker][:id]) 
      @project.hackers << @hacker
    end

    if @project.save
      redirect_to(@project, :notice => "Hacker was added!")
    else
      flash[:errors] = @project.errors.full_messages
    end
  end

  def update
    @project = Project.find(params[:id])
    if(@project.update_attributes(params[:project]))
      redirect_to(@project)
    else
      redirect_to(edit_project_path(@project))
    end
  end
end
