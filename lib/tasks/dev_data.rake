namespace :app do
  
  namespace :seed do
  
    task :galas => :environment do 
      
      [Gala, Combat].each(&:delete_all)
    
      Promoteur.all.each do |promoteur|
                
        gala = Gala.create! do |g|
          
          g.nom = "Drapeau #{Faker::NameSN::name_sn}"
          g.promoteur_id = promoteur.id
          g.occurs_at    = Date.today + (rand(10)+1).weeks
          g.featured     = true       
          
        end
        
        5.times do |t|
          Combat.create! do |combat|
            combat.occurs_at = gala.occurs_at
            combat.challenger = Lutteur.order("rand()").first
            combat.champion = Lutteur.where("id != ?", combat.challenger.id).order("rand()").first
            combat.fightable = gala  
          end
        end 
        
        grand_combat = gala.combats.first
        grand_combat.featured = true
        grand_combat.save!
        
        
        
      end
      
    end 
    
    
    task :truncate => :environment do      
      [Gala, Combat, Ecury, Lutteur, User, Promoteur, AdminUser].each(&:delete_all)
    end
        
  end

  
  
  
end 