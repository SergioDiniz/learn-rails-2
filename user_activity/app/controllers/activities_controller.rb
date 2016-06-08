class ActivitiesController < ApplicationController
	before_action :find_activity, only: [:show, :edit, :update, :destroy] 

	def index
		@activities = Activity.all.order('created_at DESC')
	end

	def show
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)

		if @activity.save
			redirect_to root_path, notice: "Postado com Sucesso!"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @activity.update(activity_params)
			redirect_to @activity, notice: "Atualizado com Sucesso!"
		else
			render 'edit'
		end
	end

	def destroy
		@activity.destroy
		redirect_to root_path
	end
	
	private

	def activity_params
		params.require(:activity).permit(:description)
	end

	def find_activity
		@activity = Activity.find(params[:id])
	end

end
