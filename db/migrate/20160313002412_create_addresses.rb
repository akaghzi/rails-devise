class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, index: true
      t.string :address_1, null: false
      t.string :address_2
      t.references :province, index: true, foreign_key: true
      t.string :city, null: false
      t.string :postal_code
      t.boolean :current, null: false

      t.timestamps null: false
    end
  end
end
