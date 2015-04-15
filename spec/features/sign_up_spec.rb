require 'rails_helper'

RSpec.feature "User can sign up" do
	scenario "when providing valid details" do
		visit "/"

		click_link "Зарегистрироваться"
		fill_in "E-mail", with: "testovich@example.com"
		fill_in "Пароль", with: "password"
		fill_in "Подтверждение пароля", with: "password"
		fill_in "Фамилия", with: "Иванов"
		fill_in "Имя", with: "Иван"
		click_button "Зарегистрироваться"
		email = find_email!('testovich@example.com')
		expected_subject = "Инструкции по подтверждению учётной записи"
		expect(email.subject).to eq(expected_subject)
		click_first_link_in_email(email)
		#expect(page).to have_heading(ticket.title)
		expect(page).to have_content("Ваш адрес электронной почты успешно подтвержден.")
	end
end