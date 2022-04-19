class SeatsController < ApplicationController

	def index
		@seats = Seat.all
		#@employee = Employee.find(params[:id])
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

	def seat_apply_mail
	    @employee = current_user.email
	    @seat = Seat.find(params[:seat_id])
		SeatrequestMailer.with(seat: @seat, employee: @employee, name: params[:query], reason: params[:reason]).seat_apply_mail.deliver_now 
		if @seat.save
			redirect_to @seat
			flash[:notice] = 'send successfully!'
		else
			flash[:error] = 'Failed !'
			render :new
		end
	end

	
	private

	def seat_param
		params.require(:seat).permit(:seat_no)
	end
end
