require 'rails_helper'

RSpec.describe "cheers/new", type: :view do
  before(:each) do
    assign(:cheer, Cheer.new(
      :user => nil,
      :goal => nil
    ))
  end

  it "renders new cheer form" do
    render

    assert_select "form[action=?][method=?]", cheers_path, "post" do

      assert_select "input[name=?]", "cheer[user_id]"

      assert_select "input[name=?]", "cheer[goal_id]"
    end
  end
end
