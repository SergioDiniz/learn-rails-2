module ActivitiesHelper
	def belogns_to_user(activity)
		user_signed_in? && activity.user == current_user
	end
end
