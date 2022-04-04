class SeatsController < ApplicationController

	def index
		@seats = Seat.all
	end

	def show
		@seat = Seat.find(params[:id])
		#@employee = Employee.find(@seat.id)
    end

	def new
		@seat = Seat.new
	end

	def create
		@seat = Seat.new(seat_param)

		if @seat.save
			redirect_to @seat
			flash[:notice] = "Employee Created successfully!" 

		else
			render :new
			flash[:error] = "Something went wrong!!"
		end
	end

	def edit
		
		@seat = Seat.find(params[:id])
	end

	def update
		@seat = Seat.find(params[:id])
		if @seat.update(seat_param)
			redirect_to @seat
			flash[:notice] = "seat Updated successfully!" 

		else

			render :edit  
		end
	end

	def destroy
		@seat = Seat.find(params[:id])
		@seat.destroy

		redirect_to root_path
		flash[:notice] = "Seat Deleted successfully!" 
	end

	

	private

	def seat_param
		params.require(:seat).permit(:seat_no)
	end
end
