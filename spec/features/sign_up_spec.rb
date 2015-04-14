require 'rails_helper'

RSpec.feature "User can sign up" do
	scenario "when providing valid details" do
		visit "/"

		click_link "Зарегистрироваться"
		fill_in "E-mail", with: "test@example.com"
		fill_in "Пароль", with: "password"
		fill_in "Подтверждение пароля", with: "password"
		fill_in "Фамилия", with: "Иванов"
		fill_in "Имя", with: "Иван"
		click_button "Зарегистрироваться"
		expect(page).to have_content("Вы успешно зарегистрировались")
	end
end