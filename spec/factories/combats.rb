# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :combat do
    occurs_at "2011-10-07 20:04:03"
    association :challenger, :factory => :lutteur
    association :champion, :factory => :lutteur
    champion_id 2
    fightable_id 1
    fightable_type "Gala"
    featured false
  end
  
end