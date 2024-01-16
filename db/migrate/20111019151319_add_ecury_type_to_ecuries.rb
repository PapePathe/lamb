class AddEcuryTypeToEcuries < ActiveRecord::Migration
  def change
    add_column :ecuries, :ecury_type_id, :integer
  end
end
