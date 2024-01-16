class AddVainqueurIdAndVerdictDeclareToCombats < ActiveRecord::Migration
  def change
    add_column :combats, :vainqueur_id, :integer, :default => 0
    add_column :combats, :verdict_declare, :boolean, :default => false
  end
end
