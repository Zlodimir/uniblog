require 'rails_helper'

RSpec.feature "User can sign in" do
	let!(:user) {FactoryGirl.create(:user)}

	before do
		visit "/"
	end

	scenario "with valid credentials" do
		click_link "Войти"

		fill_in "E-mail", with: user.email
		fill_in "Пароль", with: "password"
		click_button "Вход"

		expect(page).to have_content("Вход в систему выполнен")
		expect(page).to have_content(user.email)
	end
end