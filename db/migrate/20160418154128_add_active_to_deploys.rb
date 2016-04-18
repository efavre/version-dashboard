class AddActiveToDeploys < ActiveRecord::Migration
  def change
    add_column :deploys, :active, :boolean, default: true
  end
end
