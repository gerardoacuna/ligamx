FactoryGirl.define do
	factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    username "pepito"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :bid do
    price { 10 + rand(20) }
    sequence(:team_id) { |n| n }
    sequence(:user_id) { |n| n }
  end
end