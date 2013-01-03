class AdminController < ApplicationController

	before_filter :admin_user

	layout "admin"

	private
		def admin_user
      redirect_to(root_path) unless current_user.has_role? :admin
      flash[:alert] = "Restricted area."
		end
end