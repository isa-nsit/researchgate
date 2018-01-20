class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :selected_projects, dependent: :destroy
  has_many :complete_projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def ongoingProjectsCount
  	ProjectUserAdminRelation.where(admin_id:id).count
  end

  @@allIds=[]

  def getOngoingProjects faculty_id
    ids=[]
    @@allIds=[]
    relations=ProjectUserAdminRelation.where(admin_id: faculty_id)
    relations.each do |r|
      ids<<r.SelectedProject_id
    end
    ids.each do |i|
      @@allIds<<i
    end
    SelectedProject.select("ProjectName").where(id: ids)
  end

  def getCompletedProjects faculty_id
    ids=[]
    relations=CompleteProject.where(Admin_id: faculty_id)
    relations.each do |r|
      ids<<r.SelectedProject_id
    end
    ids.each do |i|
      @@allIds<<i
    end
    SelectedProject.select("ProjectName").where(id: ids)
  end

  def getStudents
    students=SelectedProject.select("email1,email2,email3,email4,email5").where(id: @@allIds)
    return students
  end
end
