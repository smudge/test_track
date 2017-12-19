FactoryBot.define do
  factory :split do
    sequence(:name) { |i| "split_#{i}" }
    association :owner_app, factory: :app
    registry hammer_time: 100, touch_this: 0

    trait :decided do
      decided_at Time.zone.now
      registry hammer_time: 0, touch_this: 100
    end
  end
end
