require 'awesome_print'

class ApiHubeauCodeSite < ApplicationService
  BASE_URL = "https://hubeau.eaufrance.fr/api/v1"

  def initialize(code)
    @code = code
  end

  def call
    uri = URI("#{BASE_URL}/hydrometrie/observations_tr?code_entite=#{@code}&date_debut_obs=#{Date.today}&fields=resultat_obs%2Cdate_obs&grandeur_hydro=Q")
    result = JSON.parse(Net::HTTP.get(uri))
    p result[(:dat_ops)]
    # file = File.read(result)
    # data_hash = JSON.parse(result.body.read)
    # p data_hash
  end
end
