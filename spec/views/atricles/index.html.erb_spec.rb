require 'rails_helper'

RSpec.describe "atricles/index", :type => :view do
  before(:each) do
    assign(:atricles, [
      Atricle.create!(
        :title => "Title",
        :text => "Text"
      ),
      Atricle.create!(
        :title => "Title",
        :text => "Text"
      )
    ])
  end

  it "renders a list of atricles" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
