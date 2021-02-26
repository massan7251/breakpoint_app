FactoryBot.define do
  factory :room do
    agenda      {'A or B'}
    stanceA     {'A'}
    stanceB     {'B'}
    user_id     {1}
  end
end
