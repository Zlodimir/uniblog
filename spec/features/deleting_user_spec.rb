require 'rails_helper'

RSpec.feature "User can sign in" do
	let!(:user) {FactoryGirl.create(:user, lastname: "Ivanov", firstname: "Ivan")}
	let!(:admin) {FactoryGirl.create(:user, :admin)}

	#before do
		#login_as(admin)
	#end

	scenario "an admin can delete user" do
		login_as(user)
		visit "/"
		click_link "Админка"

		click_link user.email

		fill_in "E-mail", with: user.email
		fill_in "Пароль", with: "password"
		click_button "Удалить"

		expect(page).to have_content("Пользователь удален")
		expect(page).not_to have_content(user.email)
	end
end