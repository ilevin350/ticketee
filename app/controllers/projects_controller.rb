class ProjectsController < ApplicationController
	def index

	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.save
		redirect_to @project, notice: "Project has been created successfully"
	end

	def show
		@project = Project.find(params[:id])
	end

	private
	def project_params
		params.require(:project).permit(:name)
	end
end
