FactoryGirl.define do 
	factory :user do
		sequence(:email) {|n| "test#{n}@example.com"}
		password "password"
		lastname "Ivanov"
		firstname "Ivan"

		trait :admin do
			admin true
		end
	end
end