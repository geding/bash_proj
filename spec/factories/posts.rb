# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    author "MyString"
    content "MyText"
    likes 1
    dislikes 1
  end
end
