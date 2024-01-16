Given /^I have amateurs (.+)$/ do |noms|
  noms.split(',').each do |nom|
    FactoryGirl.create(:user, :nom_complet => nom)
  end
end
