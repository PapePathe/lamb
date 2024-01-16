ActiveAdmin.register Lutteur do

  menu :parent => "Ecuries"

  index do
    column :surnom 
    column :ecury, :sortable => false
    column :featured
    column :vip
    
    default_actions
  end
  
  filter :surnom
  filter :ecury
  
end
