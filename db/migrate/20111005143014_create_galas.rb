class CreateGalas < ActiveRecord::Migration
  def change
    create_table :galas do |t|
      t.string :nom

      t.timestamps
    end
  end
end
