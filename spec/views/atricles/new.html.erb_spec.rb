require 'rails_helper'

RSpec.describe "atricles/new", :type => :view do
  before(:each) do
    assign(:atricle, Atricle.new(
      :title => "MyString",
      :text => "MyString"
    ))
  end

  it "renders new atricle form" do
    render

    assert_select "form[action=?][method=?]", atricles_path, "post" do

      assert_select "input#atricle_title[name=?]", "atricle[title]"

      assert_select "input#atricle_text[name=?]", "atricle[text]"
    end
  end
end
