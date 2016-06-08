class UserSessionsController < ApplicationController
	def new
		@user_session = UserSession.new(session)
	end

	def create
		@user_session = UserSession.new(session, user_session_params)

		if @user_session.authenticate!
			redirect_to root_path, notice: "Login realizado com Sucesso!"
		else
			render 'new'
		end
	end

	def destroy
		user_session.destroy
		redirect_to root_path, notice: "Você saiu. Até logo!"
	end

	private

	def user_session_params
		params.require(:user_session).permit(:email, :password)
	end
end