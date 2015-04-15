require 'rails_helper'

RSpec.feature "User can sign in" do
	let!(:user1) {FactoryGirl.create(:user, lastname: "Ivanov", firstname: "Ivan")}
	let!(:user2) {FactoryGirl.create(:user)}

	before do
		login_as(user1)
		visit "/"
	end

	scenario "user can see only his own profile" do
		click_link user1.email
		visit user_path(user2)

		expect(page.current_path).to eq(root_path)
		expect(page).to have_content('Ошибка')
	end
end