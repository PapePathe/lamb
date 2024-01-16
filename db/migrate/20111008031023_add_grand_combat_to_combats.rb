class AddGrandCombatToCombats < ActiveRecord::Migration
  def change
    add_column :combats, :grand_combat, :boolean, :default => false
  end
end
