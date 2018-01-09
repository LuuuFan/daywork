require 'rails_helper'

RSpec.describe "cheers/show", type: :view do
  before(:each) do
    @cheer = assign(:cheer, Cheer.create!(
      :user => nil,
      :goal => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
