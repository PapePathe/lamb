class CreateEcuries < ActiveRecord::Migration
  def change
    create_table :ecuries do |t|
      t.string :nom
      t.integer :lutteurs_count, :default => 0

      t.timestamps
    end
  end
end
