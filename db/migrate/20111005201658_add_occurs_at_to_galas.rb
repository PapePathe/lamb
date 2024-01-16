class AddOccursAtToGalas < ActiveRecord::Migration
  def change
    add_column :galas, :occurs_at, :datetime
  end
end
