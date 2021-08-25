class Topo < ApplicationRecord
  belongs_to :river
  has_many :favorites
  has_many :comments
  has_many :levels
end
