require 'rails_helper'

RSpec.describe "cheers/edit", type: :view do
  before(:each) do
    @cheer = assign(:cheer, Cheer.create!(
      :user => nil,
      :goal => nil
    ))
  end

  it "renders the edit cheer form" do
    render

    assert_select "form[action=?][method=?]", cheer_path(@cheer), "post" do

      assert_select "input[name=?]", "cheer[user_id]"

      assert_select "input[name=?]", "cheer[goal_id]"
    end
  end
end
