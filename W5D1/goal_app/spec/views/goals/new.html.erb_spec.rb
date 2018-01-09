require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      :title => "MyString",
      :details => "MyText",
      :private => false,
      :completed => false,
      :user => nil
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input[name=?]", "goal[title]"

      assert_select "textarea[name=?]", "goal[details]"

      assert_select "input[name=?]", "goal[private]"

      assert_select "input[name=?]", "goal[completed]"

      assert_select "input[name=?]", "goal[user_id]"
    end
  end
end
