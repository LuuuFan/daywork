FactoryBot.define do
  factory :goal do
    title "MyString"
    details "MyText"
    private false
    completed false
    user nil
  end
end
