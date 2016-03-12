class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.references :country, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
