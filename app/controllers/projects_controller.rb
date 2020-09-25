class ProjectsController < ApplicationController
  def index
  	@projects = Project.all
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

  private

  def project_params
  	params.require(:project).permit(:title, :description)
  end
end
