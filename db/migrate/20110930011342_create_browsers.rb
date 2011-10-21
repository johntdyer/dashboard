class CreateBrowsers < ActiveRecord::Migration
  def change
    create_table :browsers do |t|
      t.string :hostname
      t.string :description
      t.string :slug
      t.timestamps
    end
  end
end
