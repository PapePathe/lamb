# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|

    sequence :email do |n|
      "amateur#{n}@ndefleng.com"
    end

    u.password 'ndefleng'
    u.nom_complet 'ndefleng base'
  end
end
