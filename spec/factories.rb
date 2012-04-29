FactoryGirl.define do

  #
  # Secuences
  #
  sequence(:random_phrase) { 1.sentences }
  sequence(:random_text)   { 3.sentences }
  sequence(:issue_code)    { |n| n.to_s  }

  #
  # Factories
  #
  factory :user, aliases: [:creator, :responsable] do
    login "Johny"
    password "123123"
  end

  factory :project do
    name "Teixo"
    association :creator, factory: :user, strategy: :build
  end

  factory :issue do
    code  { generate(:issue_code) }
    title { generate(:random_phrase) }
    description { generate(:random_text) }
    association :project, factory: :project, strategy: :build
    association :creator, factory: :user, strategy: :build
    status 'unstarted'
  end

end