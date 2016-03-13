class CreateCompanyServices < ActiveRecord::Migration
  def change
    create_table :company_services do |t|
      t.references :company, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
