class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :selected_projects
  has_many :complete_projects
  has_many :project_user_admin_relations
  has_many :users, through: :selectedprojects
end
