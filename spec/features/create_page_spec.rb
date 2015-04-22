require 'rails_helper'

RSpec.feature "Admin can create news" do
	let!(:admin) {FactoryGirl.create(:user, :admin)}

	before do
		login_as(admin)
		visit "/"
		
		click_link "Админка"
		#click_link "Новости"
		within first(".col-md-7 .nav-stacked") do
  		  first(:link, "Страницы").click
		end
		click_link "Создать"

		fill_in "Название", with: "Сантехник Иванов сбрил бороду"
		fill_in "Содержание", with: "Иванов описание того как он сбривал бороду"

		click_button "Создать Страница"
	end

	scenario "an admin can create news" do
		expect(page).to have_content("Страница создана")
		expect(page).to have_content('Сантехник Иванов сбрил бороду')
	end

	scenario 'verify page title' do
		item = Page.find_by(name: 'Сантехник Иванов сбрил бороду')
		expect(page.current_url).to eql(admin_page_url(item))
		title = item.name + ' - ' + 'Страницы - Блог'
		expect(page).to have_title(title)
	end
end