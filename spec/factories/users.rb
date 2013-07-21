# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email ENV["ADMIN_EMAIL"].dup
    password ENV["ADMIN_PASSWORD"].dup
    uid ENV["ADMIN_UID"].dup
    provider "brave_id"
  end
end
