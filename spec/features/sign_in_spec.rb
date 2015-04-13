require 'rails_helper'

RSpec.feature "User can sign in" do
	let!(:user) {FactoryGirl.create(:user)}

	scenario "with valid credentials" do
		visit "/"
		click_link "Войти"

		fill_in "E-mail", with: user.email
		fill_in "Пароль", with: "password"
		click_button "Вход"

		expect(page).to have_content("Вход в систему выполнен")
		expect(page).to have_content("Вы вошли как #{user.firstname} #{user.lastname} (#{user.email})")
	end
end