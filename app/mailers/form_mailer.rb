class FormMailer < ApplicationMailer


	def FormSubmission(task,email,admin)
       @task=task
       @email=email
       @admin=admin
       mail(to: @email,:cc => @task.email1, subject: 'Idea for Project')

	end
end
