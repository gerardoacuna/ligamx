class HomeController < ApplicationController
	def index
		@announcements = Announcement.all
		@players = User.limit(10).order_by_portfolio
	end
end
