class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		user_path(current_user.id)
	end

	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	before_action :configure_permitted_parameters, if: :devise_controller?
	# ログイン情報の変更　ストロングパロメータ

	protected

  def configure_permitted_parameters # ログイン情報の変更　ストロングパロメータ
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email]) #emailも入れておかないとはじかれる
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end
