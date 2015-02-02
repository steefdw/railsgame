FactoryGirl.define do
  factory :option do
    sequence(:value) { |n| "Option #{n}" }
    rpmA { rand * 5 }
    rpmB { rand * 5 }
    rpmC { rand * 5 }
    rpmD { rand * 5 }
    rpmE { rand * 5 }
    modifier { rand }

    option_type
  end
end
