# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tournoi do
      title "MyString"
      short_title "MyStr"
      description "MyText"
      promoteur_id 1
      editions_count 1
    end
end