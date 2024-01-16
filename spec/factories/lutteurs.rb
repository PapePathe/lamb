# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lutteur do
      surnom "MyString"
      vip    false
      ecury_id 1
      slogan "slogan"
    end
end