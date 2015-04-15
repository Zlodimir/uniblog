require 'rails_helper'

RSpec.feature "User can sign in" do
	let!(:user) {FactoryGirl.create(:user, lastname: "Ivanov", firstname: "Ivan")}
	let!(:admin) {FactoryGirl.create(:user, :admin)}

	before do
		login_as(admin)
		visit "/"
	end

	scenario "an admin can delete user" do
		click_link "Админка"
		click_link "Пользователи"
		click_link user.email
		click_link "Удалить"

		expect(page).to have_content("Пользователь удален")
		expect(page).not_to have_content(user.email)
	end
end