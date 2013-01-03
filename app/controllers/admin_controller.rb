class AdminController < ApplicationController

	before_filter :admin_user

	layout "admin"

	private
		def admin_user
			unless current_user.has_role? :admin
	      redirect_to(root_path)
	      flash[:alert] = "Restricted area."
	    end
		end
end