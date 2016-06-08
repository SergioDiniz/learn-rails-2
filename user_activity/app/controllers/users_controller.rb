class UsersController < ApplicationController
	before_action :find_user, only: [:show]

	def index
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user, notice: "Cadrastro Realizado com Sucesso!"
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
	end

	def find_user
		@user = User.find(params[:id])
	end

	def destroy
		@session[:user_id] = nil
	end
end
