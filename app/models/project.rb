class Project < ActiveRecord::Base
	validates :name, :desc, :category, presence: true
	belongs_to :admin
	has_and_belongs_to_many :users
end
