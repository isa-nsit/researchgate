class Accepted < ApplicationMailer

	def FormSubmission(task,email)
       @task=task
       @email=email
        @admin=Admin.where(:id=>@task.admin_id.to_s).name
       mail( to: @email, subject: 'Your idea has been Accepted')

	end
end
