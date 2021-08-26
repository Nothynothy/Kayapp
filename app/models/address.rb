class Address < ApplicationRecord
  has_many :departures, foreign_key: :departure_id, class_name: "Topo"
  has_many :arrivals, foreign_key: :arrival_id, class_name: "Topo"
  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?
end
