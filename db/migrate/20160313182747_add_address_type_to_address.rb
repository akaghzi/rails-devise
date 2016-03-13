class AddAddressTypeToAddress < ActiveRecord::Migration
  def change
    add_reference :addresses, :address_type, foreign_key: true, index: true
  end
end
