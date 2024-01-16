ActiveAdmin.register AdminUser do

  menu :label => "Admins"
  #title "Administrateurs"
  
  index do
    column :email do |user|
      link_to user.email, admin_admin_user_path(user)
    end
    column :current_sign_in_at 
    column :current_sign_in_ip
    column :last_sign_in_at 
    column :last_sign_in_ip
    column :created_at
  end
  
  
  filter :email
  
end
