FactoryBot.define do
  factory :room do
    agenda      {'A or B'}
    stanceA     {'A'}
    stanceB     {'B'}
    association :user
  end
end
