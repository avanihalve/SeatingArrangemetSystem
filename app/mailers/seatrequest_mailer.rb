class SeatrequestMailer < ApplicationMailer
	def seat_apply_mail
  	@employee = params[:employee]
  	@seat = params[:seat]
  	@name = params[:name]
  	mail(from: @employee, to: "avihalve@gmail.com", subject: 'Requested for New Seat')
  end
end
