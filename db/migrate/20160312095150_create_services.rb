class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
