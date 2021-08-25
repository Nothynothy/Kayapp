class Topo < ApplicationRecord
  belongs_to :river
  belongs_to :departure, class_name: "Address"
  belongs_to :arrival, class_name: "Address"
  has_many :favorites
  has_many :comments
  has_many :levels
end
