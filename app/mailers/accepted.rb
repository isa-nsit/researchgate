class Accepted < ApplicationMailer

	def FormSubmission(task,email,Prof)
       @task=task
       @email=email
       @ProfName=Prof
       mail( to: @email, subject: 'Your idea has been Accepted')

	end
end
