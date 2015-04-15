require 'rails_helper'

RSpec.feature "Admin can change user attributes" do
	let!(:user) {FactoryGirl.create(:user, lastname: "Ivanov", firstname: "Ivan")}
	let!(:admin) {FactoryGirl.create(:user, :admin)}

	before do
		login_as(admin)
		visit "/"
	end

	scenario "an admin can change user" do
		click_link "Админка"
		click_link "Пользователи"
		click_link user.email
		click_link "Редактировать"

		fill_in "Фамилия", with: "Иванов"

		click_button "Сохранить Пользователь"

		expect(page).to have_content("Пользователь изменен")
		expect(page).not_to have_content(user.lastname)
	end
end