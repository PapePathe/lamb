class CreateEcuryTypes < ActiveRecord::Migration
  def change
    create_table :ecury_types do |t|
      t.string :titre

      t.timestamps
    end
  end
end
