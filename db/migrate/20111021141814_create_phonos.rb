class CreatePhonos < ActiveRecord::Migration
  def change
    create_table :phonos do |t|

      t.timestamps
    end
  end
end
