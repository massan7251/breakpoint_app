FactoryBot.define do
  factory :post do
    post_a     {'aaaaaaaaaa'}
    post_b     {'bbbbbbbbbb'}
    association :user
    association :room
  end
end
