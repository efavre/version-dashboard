class CreateDeploys < ActiveRecord::Migration
  def change
    create_table :deploys do |t|
      t.string :application
      t.string :version
      t.string :environment

      t.timestamps null: false
    end
  end
end
