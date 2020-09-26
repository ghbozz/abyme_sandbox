class ProjectsController < ApplicationController
  def index
  	@projects = current_user.projects
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params.merge(user: current_user))

  	if @project.save
  		redirect_to projects_path
  	else
  		broadcast_errors @project, project_params
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
  	params.require(:project).permit(:title, :description)
  end
end
