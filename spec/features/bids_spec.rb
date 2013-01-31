require 'spec_helper'

describe "Bids" do
  it "create bid when user makes an offer" do
  	bid = create(:bid)
    user = create(:user)
    visit market_path
    fill_in "bid_price_#{bid.id}", with: bid.price
    click_button "Make Bid"
  end
end
