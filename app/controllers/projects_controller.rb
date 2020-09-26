class ProjectsController < ApplicationController
  def index
  	@projects = current_user.projects
  	@project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
  	@project = Project.new(project_params.merge(user: current_user))
  	@project.save ? redirect_to(projects_path) : broadcast_errors(@project, project_params)
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
  	params.require(:project).permit(:title, :description, :thumbnail)
  end
end
