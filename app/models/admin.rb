class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :selected_projects, dependent: :destroy
  has_many :complete_projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def ongoingProjectsCount
  	ProjectUserAdminRelation.where(admin_id:id.to_s).count
  end

  @@allIds=[]

  def getOngoingProjects faculty_id
    ids=[]
    @@allIds=[]
    relations=ProjectUserAdminRelation.where(admin_id: faculty_id.to_s)
    relations.each do |r|
      ids<<r.SelectedProject_id
    end
    projects=[]
    ids.each do |i|
      projects<<SelectedProject.select("ProjectName").where(id: i.to_s).first
      @@allIds<<i
    end
    return projects
  end

  def getCompletedProjects faculty_id
    ids=[]
    relations=CompleteProject.where(Admin_id: faculty_id.to_s)
    relations.each do |r|
      ids<<r.SelectedProject_id
    end
    
    projects=[]
    ids.each do |i|
      projects<<SelectedProject.select("ProjectName").where(id: i.to_s).first
      @@allIds<<i
    end
    return projects
  end

  def getStudents
    students=[]
    @@allIds.each do |i|
      students<<SelectedProject.select("email1,email2,email3,email4,email5").where(id: i.to_s).first
    end
    return students
  end
end
