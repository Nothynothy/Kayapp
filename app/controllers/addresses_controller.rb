class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @markers = @addresses.geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude
      }
    end
  end
end
