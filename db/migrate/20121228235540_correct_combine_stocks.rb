class CorrectCombineStocks < ActiveRecord::Migration
  def up
  	User.all.each do |user|
  		#count number of each product in the cart
  		sums = user.stocks.group(:team_id, :price).sum(:quantity)
  		sums.each do |team_id, quantity|
  			if quantity > 1
  				#remove individual items
  				user.stocks.where(team_id: team_id).delete_all
  				#replace with a single item
  				user.stocks.create(team_id: team_id, quantity: quantity)
  			end
  		end
  	end
  end

  def down
  	#split items with quantity > 1 into multiple items
    Stock.where("quantity>1").each do |stock|
	    #add individual items
	    stock.quantity.items do
	      Stock.create team_id: stock.team_id, user_id: stock.user_id, quantity: 1
	    end
	  end
    #remove original item
    stock.destroy
  end
end
