class AddVideoToCombats < ActiveRecord::Migration
  def change
    add_column :combats, :video, :string
  end
end
