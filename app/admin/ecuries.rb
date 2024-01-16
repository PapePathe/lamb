ActiveAdmin.register Ecury do
  index  do
    column :nom
    column :ecury_type
    default_actions
  end

  filter :nom

  form :partial => "form"
end
