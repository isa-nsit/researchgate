class Rejected < ApplicationMailer

	def FormSubmission(task,email)
       @task=task
       @email=email
        
    @admin=Admin.where(:id=>@task.admin_id).name

       mail(to: @email, subject: 'Your idea has been Rejected')

	end
end
