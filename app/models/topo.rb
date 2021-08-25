class Topo < ApplicationRecord
  belongs_to :river
  has_many :favorites
  has_many :comments
  has_many :topo_details

  def has_severity_2_alert?
    comments.where(category: "alert", severity: 2, active: true).any?
  end

  def has_alert?
    comments.where(category: "alert").any?
  end
end
