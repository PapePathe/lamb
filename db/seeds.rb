# encoding: UTF-8

# Delete some models
#
[Lutteur, Ecury, EcuryType ,Promoteur, Gala, Combat, AdminUser, User].each(&:delete_all)


promoteurs = YAML.load_file("#{Rails.root}/lib/app-data/promoteurs.yml")

promoteurs.each do | key, params|
  Promoteur.create params
end

# => Add EcuryTypes
#
ecury_type = EcuryType.create! :titre => 'écurie'

# Add ecuries
#

ecuries = YAML.load_file("#{Rails.root}/lib/app-data/ecuries.yml")


ecuries.each do |key, params|
  
  
  puts "creating ecury #{params['nom']}"
  e = Ecury.create! :nom => params['nom'], :ecury_type_id => ecury_type.id
  
  unless params['lutteurs'].nil?
    
    params['lutteurs'].each do |key, params|
      params['ecury_id'] = e.id
      puts "   adding lutteur: #{params['surnom']} " 
      Lutteur.create! params
    end
         
  end
  
end

# => Give Pathe Admin Rights
#
puts "creating AdminUser pathé"
AdminUser.create! :email => "pathe.sene@xarala.sn", :password => "hotkeyhacker"

# => Create Amateurs
#
100.times do
  User.create! do |user|
    user.email = Faker::Internet.email
    user.password = "amateur"
    user.nom_complet = Faker::NameSN.name_sn 
  end  
end


booleans = [true, false, false, false]

# => Populate galas
puts "creating galas & combats"
1000.times do
  
  gala = Gala.create! do |g|
    g.nom = "drapeau #{Faker::NameSN.name_sn}"
    g.promoteur = Promoteur.order('rand()').limit(1).first
    g.occurs_at = Random.date_between('2011-10-30'..'2012-05-01')
    g.featured  = booleans[rand booleans.count]
  end
  
  protagonistes = Lutteur.limit(10).order('rand()')
  
  protagonistes.in_groups_of 2 do |challenger, champion|
    
    Combat.create! do |c|
      c.occurs_at    = gala.occurs_at
      c.champion     = champion
      c.challenger   = challenger
      c.fightable    = gala
    end
    
  end
  
end

Gala.all.each do |gala|

 grand_combat = gala.combats.first
 
 grand_combat.featured = true
 grand_combat.grand_combat = true
 grand_combat.save!
  
end


# => Adding verdicts to combats
#

Combat.where('occurs_at <= ?', Time.now).each do |combat|
  arr = [0, combat.challenger_id, combat.champion_id]
  combat.verdict_declare = true
  combat.vainqueur_id = arr[rand arr.count]
  combat.save!
end
