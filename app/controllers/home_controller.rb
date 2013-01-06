class HomeController < ApplicationController
	def index
		@announcements = Announcement.all
		@players = User.top_ten
	end
end
