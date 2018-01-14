class FormMailer < ApplicationMailer


	def FormSubmission(task,email)
       @task=task
       @email=email
       mail(to: @email, subject: 'Welcome to My Awesome Site')

	end
end
