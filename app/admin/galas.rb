ActiveAdmin.register Gala do

  menu :parent => "Promoteurs"
  
  index do

    column :nom do |gala|
      link_to gala.nom, admin_gala_path(gala)
    end
    column :occurs_at
    column :promoteur, :sortable => false
    column :featured
    
    default_actions
    
    #filter :promoteur_id
    
  end
  
  filter :nom
  
end
