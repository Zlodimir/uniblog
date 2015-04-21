require 'rails_helper'

RSpec.describe "atricles/show", :type => :view do
  before(:each) do
    @atricle = assign(:atricle, Atricle.create!(
      :title => "Title",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
  end
end
