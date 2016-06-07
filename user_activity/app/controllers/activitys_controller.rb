class ActivitysController < ApplicationController
	def index
		@activitys = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])
	end

	def new
		@activity = Activity.new
	end

	def create
		@activity = Activity.new(activity_params)

		if @activity.save
			redirect_to @activity, notice: "Postado com sucesso!"
		else
			render new
		end
	end
	
	private

	def activity_params
		params.require(:activity).permit(:description)
	end

end
