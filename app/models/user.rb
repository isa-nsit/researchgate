class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def find_user(email)
  	User.find_by(email).id
  end

  # mount_uploader :profile_pic, ProfilePicUploader
end
