class CreateTournois < ActiveRecord::Migration
  def change
    create_table :tournois do |t|
      t.string :title
      t.text :description
      t.integer :promoteur_id
      t.integer :editions_count, :default => true

      t.timestamps
    end
  end
end
