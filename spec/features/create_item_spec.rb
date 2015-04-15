require 'rails_helper'

RSpec.feature "Admin can create news" do
	let!(:admin) {FactoryGirl.create(:user, :admin)}

	before do
		login_as(admin)
		visit "/"
		
		click_link "Админка"
		click_link "Новости"
		click_link "Создать"

		fill_in "Заголовок", with: "Сантехник Иванов сбрил бороду"
		fill_in "Описание", with: "Иванов описание того как он сбривал бороду"

		click_button "Создать Новость"
	end

	scenario "an admin can create news" do
		expect(page).to have_content("Новость создана")
		expect(page).to have_content('Сантехник Иванов сбрил бороду')
	end

	scenario "new item shows on main page" do
		visit "/"
		expect(page).to have_content('Сантехник Иванов сбрил бороду')
	end
end