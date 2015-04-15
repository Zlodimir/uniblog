FactoryGirl.define do 
	factory :user do
		sequence(:email) {|n| "test#{n}@example.com"}
		password "password"
		lastname "Ivanov"
		firstname "Ivan"
		confirmed_at DateTime.now
		sequence(:confirmation_token) { |r| "test#{r}token"}
		confirmation_sent_at DateTime.now

		trait :admin do
			admin true
		end
	end
end