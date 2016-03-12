class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
