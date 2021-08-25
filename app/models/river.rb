class River < ApplicationRecord
  has_many :topos

  def safe?
    [true, false].sample
  end
end
