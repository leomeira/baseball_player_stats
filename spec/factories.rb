FactoryGirl.define do
  factory :division, class: Physical::Division do
    league
    sequence(:name) { |n| "league_#{n}" }
  end

  factory :league, class: Physical::League do
    sequence(:name) { |n| "league_#{n}" }
  end

  factory :player, class: Physical::Player do
    team
    sequence(:surname) { |n| "surname_#{n}" }
    sequence(:given_name) { |n| "given_name_#{n}" }

    trait :with_stats do
      avg 0.57
      home_runs 2
      ops 11.7
      rbi 3
      runs 3
      steals 0
    end
  end

  factory :season, class: Physical::Season do
    sequence(:year) { |n| "#{n}" }
  end

  factory :team, class: Physical::Team do
    division
    sequence(:city) { |n| "city_#{n}" }
    sequence(:name) { |n| "team_#{n}" }
  end
end
