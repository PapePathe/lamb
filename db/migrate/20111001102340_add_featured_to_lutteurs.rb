class AddFeaturedToLutteurs < ActiveRecord::Migration
  def change
    add_column :lutteurs, :featured, :boolean, :default => false
  end
end
