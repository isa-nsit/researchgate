class FormMailer < ApplicationMailer


	def FormSubmission(task,email)
       @task=task
       @email=email
       mail(to: @email, subject: 'Idea for Project')

	end
end
