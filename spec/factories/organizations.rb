FactoryGirl.define do
  factory :school do
    sequence (:name) { |n| "#{n}-test organization" }
    description "Description doesn't matter much "

    user
  end
end
