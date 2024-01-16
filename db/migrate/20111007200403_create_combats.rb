class CreateCombats < ActiveRecord::Migration
  def change
    create_table :combats do |t|
      t.datetime :occurs_at
      t.references :challenger
      t.references :champion
      t.references :fightable, :polymorphic => true
      t.boolean :featured, :default => false

      t.timestamps
    end
    add_index :combats, :challenger_id
    add_index :combats, :champion_id
  end
end
