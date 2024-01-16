class CreateLutteurs < ActiveRecord::Migration
  def change
    create_table :lutteurs do |t|
      t.string :surnom

      t.timestamps
    end
  end
end
