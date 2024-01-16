Given /^I have galas named (.+) organised by (.+)$/ do |noms, nom_promoteur|
  promoteur = Promoteur.create! :nom => nom_promoteur

  noms.split(',').each do |nom|
    Gala.create! do |g|
      g.nom          = nom
      g.occurs_at    = Date.today + 1.weeks
      g.promoteur_id = promoteur.id
      g.featured     = true
    end
  end

end

Given /^(.+) has a featured combat (.+) contre (.+)$/ do |nom_gala, champion, challenger|
  e = FactoryGirl.create(:ecury, :nom => 'wa xarala')
  g = Gala.find_by_nom(nom_gala)

  Combat.create! do |c|
    c.occurs_at      = g.occurs_at
    c.champion_id    = FactoryGirl.create(:lutteur, {:surnom => champion, :ecury_id => e.id } ).id
    c.challenger_id  = FactoryGirl.create(:lutteur, {:surnom => challenger, :ecury_id => e.id } ).id
    c.featured       = true
    c.fightable_type = 'Gala'
    c.fightable_id   = g.id
  end

end

