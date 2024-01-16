# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gala do
      nom "MyString"
      occurs_at Date.tomorrow
      promoteur_id 1
    end
end