ActiveAdmin.register Combat do
  menu :parent => "Promoteurs"

  index do
    column :occurs_at, :label => "titre du combat" do |combat|
      link_to combat.titre, admin_combat_path(combat)
    end
    column :occurs_at
    column :fightable, :sortable => false
    column :featured
    column :grand_combat
  end

  show do
    render :partial => 'show'
  end

  filter :occurs_at
  filter :grand_combat

  form :partial => 'form'
end
