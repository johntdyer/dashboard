class AddDescriptionToPhono < ActiveRecord::Migration
  def change
    add_column :phonos, :description, :string
  end
end
