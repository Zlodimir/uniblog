require 'rails_helper'

RSpec.feature "User can comment on item" do
  let(:user) { FactoryGirl.create :user }
  let(:item) { FactoryGirl.create :item }

  before do
    load "#{Rails.root}/db/seeds.rb"
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

  scenario "not logined user can not create comment" do
    click_link 'Выход'
    visit item_path(item)
    #fill_in "Комментарий", with: "Added a comment!"
    click_button "Прокомментировать"

    expect(page).to have_content("Комментарий не создан")
  end
end