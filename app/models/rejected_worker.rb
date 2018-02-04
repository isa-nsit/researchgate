class RejectedWorker < ActiveRecord::Base


	@queue = :send_task
 
 	def self.perform (task,email)
 		
 	    @task=Task.where(id: task.to_s).first
 		Rejected.FormSubmission(@task,email).deliver_now
 	end
end
