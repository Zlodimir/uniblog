require 'rails_helper'

RSpec.describe "tests/index", :type => :view do
  before(:each) do
    assign(:tests, [
      Test.create!(
        :title => "Title",
        :text => "Text"
      ),
      Test.create!(
        :title => "Title",
        :text => "Text"
      )
    ])
  end

  it "renders a list of tests" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
