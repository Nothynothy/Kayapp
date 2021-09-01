class River < ApplicationRecord
  has_many :topos

  def safe?
    true
  end
end
