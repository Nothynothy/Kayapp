require 'awesome_print'

class ApiHubeauSiteName < ApplicationService
  BASE_URL = "https://hubeau.eaufrance.fr/api/v1"

  def initialize(name)
    @name = name
  end

  def call
    uri = URI("#{BASE_URL}/hydrometrie/referentiel/sites?fields=code_site%2Clibelle_site&format=json&libelle_cours_eau=#{@name}")
    result = JSON.parse(Net::HTTP.get(uri))
    result['data'].map { |key| key['libelle_site'] }
  end
end
