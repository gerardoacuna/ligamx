class HomeController < ApplicationController
	def index
		@announcements = Announcement.all
		@players = User.order_by_portfolio
	end
end
