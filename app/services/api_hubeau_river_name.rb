require 'awesome_print'

class ApiHubeauRiverName < ApplicationService
  BASE_URL = "https://hubeau.eaufrance.fr/api/v1"

  def initialize(name)
    @name = name
  end

  def call
    uri = URI("#{BASE_URL}/hydrometrie/referentiel/sites?fields=code_site%2Clibelle_site&format=json&libelle_cours_eau=#{@name}")
    result = JSON.parse(Net::HTTP.get(uri))
    # ap result['data'][0]['code_site']
    result['data'].map { |key| key['code_site'] }
  end
end
