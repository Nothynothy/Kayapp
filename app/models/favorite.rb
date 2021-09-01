class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topo
  has_one :river, through: :topo
end
