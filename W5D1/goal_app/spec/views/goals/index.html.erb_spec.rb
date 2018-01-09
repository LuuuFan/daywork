require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        :title => "Title",
        :details => "MyText",
        :private => false,
        :completed => false,
        :user => nil
      ),
      Goal.create!(
        :title => "Title",
        :details => "MyText",
        :private => false,
        :completed => false,
        :user => nil
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
