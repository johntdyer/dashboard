class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :hostname
      t.string :description
      t.string :slug
      t.integer :datacenter_id

      t.timestamps
    end
  end
end
