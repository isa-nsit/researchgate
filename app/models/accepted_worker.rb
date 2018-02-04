class AcceptedWorker < ActiveRecord::Base


	@queue = :send_task
 
 	def self.perform (task,email)
 		
 	    @task=Task.where(id: task.to_s).first
 		Accepted.FormSubmission(@task,email).deliver_now
 	end
end
