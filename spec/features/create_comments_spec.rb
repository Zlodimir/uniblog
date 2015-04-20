require 'rails_helper'

RSpec.feature "User can comment on item" do
	let(:user) { FactoryGirl.create :user }
	let(:item) { FactoryGirl.create :item }

	before do
		login_as(user)

		visit item_path(item)
	end

	scenario "with valid attributes" do
		fill_in "Комментарий", with: "Added a comment!"
		click_button "Прокомментировать"

		expect(page).to have_content("Комментарий успешно создан")
		within("#comments") do
			expect(page).to have_content("Added a comment!")
		end
	end

	scenario "with invalid attributes" do
		click_button "Прокомментировать"

		expect(page).to have_content("Комментарий не создан")
	end
end