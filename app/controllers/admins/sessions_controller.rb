class Admins::SessionsController < Devise::SessionsController
  include Accessible
  #skip_before_action :check_user, only: :destroy
  
  #  before_action :configure_sign_in_params

  # # GET /resource/sign_in
  #  #  def new
  #  #  puts "params:"
  #  #  byebug
  #  #    puts params[:unique_code]
  #  # end

  #   # def create
  #   #   byebug
  #   #   puts "params:"
  #   #   puts params[:unique_code]
  #   # end

  #  # def sign_in
  #  #  byebug
  #  #  end
  # # DELETE /resource/sign_out
  # # def destroy
  # #   super
  # # end

  # # protected

  # # If you have extra params to permit, append them to the sanitizer.
  #  def configure_sign_in_params
  #    devise_parameter_sanitizer.permit(:sign_in, keys: [:unique_code,:email])
  #  end
end
