module TeamsHelper

	def set_first_to_active(i)
		css_classes = ['tab']
    css_classes << 'active' if i == 0
    css_classes
	end
	
	def team_chart_data
		@team.stocks do |stock|
			{
				created_at: stock.created_at,
				sell_price: stock.price
			}
		end
	end

end
