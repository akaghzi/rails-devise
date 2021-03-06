class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :profile_type, index: true, foreign_key: true
      t.references :profileable, polymorphic: true, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
