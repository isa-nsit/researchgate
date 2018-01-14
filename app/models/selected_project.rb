class SelectedProject < ActiveRecord::Base
	belongs_to :admin
	validates :email1,:ProjectName,:Description,presence: true

	def getAdminName admin_id
		Admin.find_by_id(admin_id).name
	end

	def getUserName user_email
		User.find_by_email(user_email).email
	end

	def getUserId email
		User.find_by_email(email).id
	end
end
