class Topo < ApplicationRecord
  belongs_to :river
  belongs_to :departure, class_name: "Address"
  belongs_to :arrival, class_name: "Address"
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :levels, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_topo_and_river,
    against: [ :name ],
    associated_against: {
      river: [ :name, :country, :region, :department ]
    },
    using: {
      tsearch: { prefix: true }
  }

  scope :levels, -> (levels) do
    joins(:levels).where(levels: {difficulty: levels})
  end

  def has_severity_2_alert?
    comments.where(category: "alert", severity: 'Impraticable', active: true).any?
  end

  def has_alert?
    comments.where(category: "alert", active: true).any?
  end

  def find_level
    ints = levels.map(&:difficulty)
    int_to_rom(ints)
  end

  private

  def int_to_rom(ints)
    ar = []
    int_to_roman = {  1 => 'I',
                      2 => 'II',
                      3 => 'III',
                      4 => 'IV',
                      5 => 'V',
                      6 => 'VI' }
    ints.each { |int| ar << int_to_roman[int] }
    ar
  end
end
