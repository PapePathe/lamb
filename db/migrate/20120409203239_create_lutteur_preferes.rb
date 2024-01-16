class CreateLutteurPreferes < ActiveRecord::Migration
  def change
    create_table :lutteur_preferes do |t|
      t.integer :lutteur_id
      t.integer :amateur_id
    end
    add_index :lutteur_preferes, :amateur_id
    add_index :lutteur_preferes, :lutteur_id
  end
end
