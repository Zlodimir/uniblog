require 'rails_helper'

RSpec.describe "atricles/edit", :type => :view do
  before(:each) do
    @atricle = assign(:atricle, Atricle.create!(
      :title => "MyString",
      :text => "MyString"
    ))
  end

  it "renders the edit atricle form" do
    render

    assert_select "form[action=?][method=?]", atricle_path(@atricle), "post" do

      assert_select "input#atricle_title[name=?]", "atricle[title]"

      assert_select "input#atricle_text[name=?]", "atricle[text]"
    end
  end
end
