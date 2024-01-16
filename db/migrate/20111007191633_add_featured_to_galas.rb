class AddFeaturedToGalas < ActiveRecord::Migration
  def change
    add_column :galas, :featured, :boolean, :default => false
  end
end
