require 'rails_helper'

RSpec.describe "goals/edit", type: :view do
  before(:each) do
    @goal = assign(:goal, Goal.create!(
      :title => "MyString",
      :details => "MyText",
      :private => false,
      :completed => false,
      :user => nil
    ))
  end

  it "renders the edit goal form" do
    render

    assert_select "form[action=?][method=?]", goal_path(@goal), "post" do

      assert_select "input[name=?]", "goal[title]"

      assert_select "textarea[name=?]", "goal[details]"

      assert_select "input[name=?]", "goal[private]"

      assert_select "input[name=?]", "goal[completed]"

      assert_select "input[name=?]", "goal[user_id]"
    end
  end
end
