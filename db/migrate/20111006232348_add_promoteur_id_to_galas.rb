class AddPromoteurIdToGalas < ActiveRecord::Migration
  def change
    add_column :galas, :promoteur_id, :integer, :null => false
  end
end
