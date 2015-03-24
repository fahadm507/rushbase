FactoryGirl.define do
  factory :organization do
    sequence (:name) { |n| "#{n}-test organization" }
    description "Description doesn't matter much "

    user
  end
end
