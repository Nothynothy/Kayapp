class Address < ApplicationRecord
  has_many :departures, class_name: "Topo"
  has_many :arrivals, class_name: "Topo"
end
