require 'rails_helper'

RSpec.describe "cheers/index", type: :view do
  before(:each) do
    assign(:cheers, [
      Cheer.create!(
        :user => nil,
        :goal => nil
      ),
      Cheer.create!(
        :user => nil,
        :goal => nil
      )
    ])
  end

  it "renders a list of cheers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
