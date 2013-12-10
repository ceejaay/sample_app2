FactoryGirl.define do
  factory :user do
    name "Chad"
    email "blerg@blertmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
