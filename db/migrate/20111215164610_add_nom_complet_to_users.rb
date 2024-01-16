class AddNomCompletToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nom_complet, :string
  end
end
