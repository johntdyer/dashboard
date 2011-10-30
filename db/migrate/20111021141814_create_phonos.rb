class CreatePhonos < ActiveRecord::Migration
  def change
    create_table :phonos do |t|
      t.string :hostname
      t.integer :datacenter_id
      t.string :slug
      t.timestamps
    end
  end
end
