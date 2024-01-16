class AddShortTitleToTournois < ActiveRecord::Migration
  def change
    add_column :tournois, :short_title, :string
  end
end
