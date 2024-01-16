Given /^I have ecuries named (.+)$/ do |noms|
  noms.split(',').each do |nom|
    FactoryGirl.create(:ecury, :nom => nom)
  end
end

When /^I setup & follow "([^"]*)" with (\d+) featured luttteur and (\d+) not featured lutteurs$/ do |arg1, arg2, arg3|
  # Find the ecury
  ecury = Ecury.find_by_nom arg1
  
  # Populate lutteurs
  #
  
  arg2.to_i.times do |t|
    Lutteur.create do |lutteur|
      lutteur.ecury_id = ecury.id
      lutteur.featured = true
      lutteur.surnom = "featured mbeur #{t}"
    end
  end

  arg3.to_i.times do |t|
    Lutteur.create do |lutteur|
      lutteur.ecury_id = ecury.id
      lutteur.surnom = "not featured mbeur #{t}"
    end
  end
    
  click_link arg1
end