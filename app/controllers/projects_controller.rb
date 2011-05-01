class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
        redirect_to(@project, :notice => 'Project was created successfully')
    else
        render :action => "new"
    end
  end
end
