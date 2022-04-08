class SeatrequestMailer < ApplicationMailer
	def seat_apply_mail
  	@employee = params[:employee]
  	@seat = params[:seat]
  	mail(from: @employee, to: "avihalve@gmail.com", subject: 'Requested for Seat')
  end
end
