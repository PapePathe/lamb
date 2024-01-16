Given /^I have promoteurs named (.+)$/ do |names|
 names.split(' ').each do |nom|
   Promoteur.create :nom => nom
 end
end
