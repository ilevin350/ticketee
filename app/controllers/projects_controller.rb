class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Project has been created successfully"
			redirect_to @project
		else
			# Alternately, we could put the error message in the flash notice, like this:
			# "Project has not been created - #{@project.errors.full_messages}"
			flash[:alert] = "Project has not been created"
			render :action => "new"
		end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update_attributes(permit(params[:project]))
			flash[:notice] = "Project has been updated."
			redirect_to @project
		else
			flash[:alert] = "Project has not been updated."
			render :action => "edit"
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	private
	def project_params
		params.require(:project).permit(:name)
	end

	def permit(params)
		params.permit(:name)
	end
end
