class Work < ActiveRecord::Base

	validates :name, :year, :string, :branch, :sop , presence: true
end
