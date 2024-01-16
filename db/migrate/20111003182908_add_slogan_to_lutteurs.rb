class AddSloganToLutteurs < ActiveRecord::Migration
  def change
    add_column :lutteurs, :slogan, :string
  end
end
