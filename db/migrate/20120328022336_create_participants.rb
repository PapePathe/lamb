class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :tournoi_id
      t.integer :lutteur_id

      t.timestamps
    end
  end
end
