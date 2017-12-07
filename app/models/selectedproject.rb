class Selectedproject < ActiveRecord::Base
	validates :name, :desc, :members_count, presence: true
	belongs_to :admin
	belongs_to :user
end
