class TicketsController < ApplicationController
	before_filter :find_project
	def new
		@ticket = @project.tickets.build # Note: build is an alias for new
	end

	def create
		@ticket = @project.tickets.build(params[ticket_params])
		if @ticket.save
			flash[:notice] = "Ticket has been successfully created"
			redirect_to [@project, @ticket] # Same as: project_ticket_path(@project, @ticket)
		else
			flash[:alert] = "Ticket has not been successfully created"
			render action: new
		end
	end

	private
	def find_project
		@project = Project.find(params[:project_id])
	end

	def ticket_params
		params.require(:ticket).permit(:title, :description)
	end
end
