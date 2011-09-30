class CreateBrowsers < ActiveRecord::Migration
  def change
    create_table :browsers do |t|
      t.string :hostname
      t.string :description

      t.timestamps
    end
  end
end
