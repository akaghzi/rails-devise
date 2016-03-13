class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :contactable, polymorphic: true, index: true
      t.string :phone
      t.string :fax
      t.string :website
      t.string :email
      t.string :twitter
      t.string :facebook
      t.string :linkedin
      t.string :googleplus

      t.timestamps null: false
    end
  end
end
