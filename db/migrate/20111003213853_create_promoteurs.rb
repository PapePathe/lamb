class CreatePromoteurs < ActiveRecord::Migration
  def change
    create_table :promoteurs do |t|
      t.string :nom

      t.timestamps
    end
  end
end
