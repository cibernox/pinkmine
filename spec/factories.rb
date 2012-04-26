FactoryGirl.define do

  #
  # Secuences
  #

  sequence(:random_text) {|n| LoremIpsum.generate }

  #
  # Factories
  #

  factory :project do
    name "Teixo"
  end

  factory :issue do
    code "1"
    title  "Formulario de alta de usuarios"
    description { generate(:random_text) }
  end

end