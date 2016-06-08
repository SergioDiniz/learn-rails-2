class ApplicationController < ActionController::Base
	delegate :current_user, :user_signed_in?, to: :user_session

	# usar os metodos nos templates
	helper_method :current_user, :user_signed_in?

	def user_session
		UserSession.new(session)		
	end

	def require_authentication
		unless user_signed_in?
			redirect_to new_user_session_path, alert: "Você precisa está logado!"
		end
	end

	def require_no_authentication
		if user_signed_in?
			redirect_to root_path, notice: "Vocã ja está logado!"
		end
	end

end