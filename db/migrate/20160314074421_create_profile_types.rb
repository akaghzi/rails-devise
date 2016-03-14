class CreateProfileTypes < ActiveRecord::Migration
  def change
    create_table :profile_types do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :profile_types, :name, unique: true
  end
end
