class Rejected < ApplicationMailer

	def FormSubmission(task,email,ProfName)
       @task=task
       @email=email
       @ProfName=ProfName
       mail(to: @email, subject: 'Your idea has been Rejected')

	end
end
