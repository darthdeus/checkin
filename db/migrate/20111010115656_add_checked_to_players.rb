class AddCheckedToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :checked, :boolean, :default => false
  end
end
