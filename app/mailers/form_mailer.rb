class FormMailer < ApplicationMailer


	def FormSubmission(task,email)
       @task=task
       @email=email
       mail(from: "railsproject007@gmail.com",to: @email, subject: 'Idea for Project')

	end
end
