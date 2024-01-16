class AddEcuryIdToLutteurs < ActiveRecord::Migration
  def change
    add_column :lutteurs, :ecury_id, :integer
  end
end
