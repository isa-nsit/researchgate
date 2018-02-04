class SendTaskWorker < ActiveRecord::Base

	@queue = :send_task
 
 	def self.perform (task,email)
 		
 	    @task=Task.where(id: task).first
 		FormMailer.FormSubmission(@task,email).deliver_now
 	end
end
