FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {'aaa111'}
    password_confirmation {password}
    name                  {Faker::Name.initials(number: 2)}
    birthday              {'2021-01-13'}
    gender_id             {2}
    prefecture_id         {2}
    job_id                {2}
  end
end
