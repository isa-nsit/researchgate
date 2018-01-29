class Accepted < ApplicationMailer

	def FormSubmission(task,email)
       @task=task
       @email=email
       mail(from: "railsproject007@gmail.com", to: @email, subject: 'Your idea has been Accepted')

	end
end
