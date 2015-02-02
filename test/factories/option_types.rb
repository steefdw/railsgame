FactoryGirl.define do
  factory :option_type do
    sequence(:value) { |n| "value #{n}" }
  end
end
