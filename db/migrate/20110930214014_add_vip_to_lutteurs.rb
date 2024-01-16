class AddVipToLutteurs < ActiveRecord::Migration
  def change
    add_column :lutteurs, :vip, :boolean, :default => false
  end
end
