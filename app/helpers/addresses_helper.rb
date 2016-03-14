module AddressesHelper
  def address_countries
    Country.order("id")
  end
end
