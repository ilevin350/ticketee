class TicketsController < ApplicationController
	before_filter :find_project
	before_filter :find_ticket, only: [:show, :edit, :update, :destroy]

	def new
		@ticket = @project.tickets.build # Note: build is an alias for new
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		begin
			if @ticket.save!
				flash[:notice] = "Ticket has been successfully created"
				redirect_to [@project, @ticket] # Same as: project_ticket_path(@project, @ticket)
			else
				flash[:alert] = "Ticket has not been successfully created"
				redirect_to @project
			end
		rescue Exception => e
			flash[:alert] = "Exception thrown attempting to save new ticket - #{e.message}"
			redirect_to @project
		end
	end

	def show

	end

	def edit

	end

	def update
		if @ticket.update_attributes(ticket_params)
			flash[:notice] = "Ticket has been updated."
			redirect_to [@project, @ticket]
		else
			flash[:alert] = "Ticket has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@ticket.destroy
		flash[:notice] = "Ticket has been deleted."
		redirect_to @project
	end

	private
	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_ticket
		@ticket = @project.tickets.find(params[:id])
	end

	def ticket_params
		params.require(:ticket).permit(:title, :description)
	end
end
