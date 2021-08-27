require 'awesome_print'

class ApiHubeauCodeSite < ApplicationService
  BASE_URL = "https://hubeau.eaufrance.fr/api/v1"

  def initialize(code)
    @code = code
  end

  def time_yesterday
    t = Time.now - 24.hours
    "#{t.year}-#{t.month}-#{t.day}T#{t.hour}:#{t.min}:#{t.sec}"
  end

  def call
    uri = URI("#{BASE_URL}/hydrometrie/observations_tr?code_entite=#{@code}&date_debut_obs=#{time_yesterday}&fields=resultat_obs%2Cdate_obs&grandeur_hydro=Q")
    result = JSON.parse(Net::HTTP.get(uri))
    # data = result.each_value { |value| puts value }
    # data = result['data'][0]['date_obs']
    # puts data
    ap result


  end
end
