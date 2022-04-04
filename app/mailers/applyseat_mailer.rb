class ApplyseatMailer < ApplicationMailer
	def send_apply_mail
  	#byebug
  	@note = params[:note]
  	@employee = params[:employee]
  	#@url  = 'http://127.0.0.1:3000/employees/new'
  	mail(from: @employee.email, to: "avihalve@gmail.com", subject: 'Query mail')
  end
end