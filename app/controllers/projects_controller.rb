class ProjectsController < ApplicationController
  before_action :set_project, only: %i(show edit update)

  def index
  	@projects = current_user.projects
  	@project = Project.new
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params.merge(user: current_user))
  	@project.save ? redirect_to(projects_path) : render(:new)
  end

  def edit
  end

  def update
    @project.update(project_params)
    
    if @project.valid?
      redirect_to edit_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end

  def project_validation
    @project = Project.new(project_params.merge(user: current_user))    
    broadcast_errors @project, project_params
  end

  private

  def project_params
  	params.require(:project).permit(
      :title, :description, :thumbnail,
      tasks_attributes: [
        :id, 
        :title, 
        :description, 
        :_destroy, 
        comments_attributes: [
          :id, 
          :content, 
          :_destroy
        ]
      ]
    )
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
