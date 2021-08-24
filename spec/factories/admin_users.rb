FactoryBot.define do
  factory :admin_user do
    name { 'Taro' }
    sequence(:email) { |n| "taro#{n}@example.com" }
    password              { 'password'}
  end
end
