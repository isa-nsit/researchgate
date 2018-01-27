class Rejected < ApplicationMailer

	def FormSubmission(task,email)
       @task=task
       @email=email
       mail(to: @email, subject: 'Your idea has been Rejected')

	end
end
