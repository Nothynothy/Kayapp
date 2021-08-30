class AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @markers = @addresses.geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude,
        info_window: render_to_string(partial: "info_window", locals: { address: address })
      }
    end
  end
end
