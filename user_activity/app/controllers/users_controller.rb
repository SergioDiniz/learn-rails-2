class UsersController < ApplicationController
	before_action :find_user, only: [:show]
	before_action :require_no_authentication, only: [:new, :create]
	before_action :require_authentication, only: [:index, :show, :edit, :update]
	before_action :can_change, only: [:edit, :update, :show]

	def index
	end

	def show
	end

	def visit
		@user_visit = find_user
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

	def can_change
		unless user_signed_in? && current_user == find_user
			redirect_to user_path(current_user)
		end
	end

	def find_user
		@user = User.find(params[:id])
	end

end
