# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    category "MyString"
    description "MyText"
    date "2013-05-04"
    time "2013-05-04 15:52:17"
    location "MyString"
    notes "MyText"
    wedding_id 1
  end
end
