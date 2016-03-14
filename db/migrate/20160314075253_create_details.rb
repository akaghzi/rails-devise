class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.references :detailable, polymorphic: true, index: true
      t.string :content

      t.timestamps null: false
    end
  end
end
