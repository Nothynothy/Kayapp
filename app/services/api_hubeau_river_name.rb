require'awesome_print'

class ApiHubeauRiverName < ApplicationService
  BASE_URL = "https://hubeau.eaufrance.fr/api/v1"

  def initialize(name)
    @name = name
  end

  def call
    uri = URI("#{BASE_URL}/hydrometrie/referentiel/sites?format=json&libelle_cours_eau=#{@name}&size=20")
    result = JSON.parse(Net::HTTP.get(uri))
    ap result
  end
end
