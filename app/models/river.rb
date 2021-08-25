class River < ApplicationRecord
  has_many :topos

  def safe?
    [true, false].sample
  end

  def alert?
    [true, false].sample
  end
end
