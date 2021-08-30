require 'awesome_print'

class ApiHubeauDataSite < ApplicationService
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
    result['data'].map { |key| { date: key['date_obs'], level: key['resultat_obs'] } }
  end
end
