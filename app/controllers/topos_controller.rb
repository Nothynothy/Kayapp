class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @topos = Topo.search_by_topo_and_river(params[:query])
    else
      @topos = Topo.all
    end
  end

  def show
    @topo = Topo.find(params[:id])
    @departure = Address.find(@topo.departure_id)
    @arrival = Address.find(@topo.arrival_id)
    comments = Comment.where(topo_id: @topo.id)
    @alerts_count = comments.where(category: "alert", active: true).count
    @data = water_data
    # @data = [{name: "Station A", data: date, labels: releve, color: "black"}]

    @json_data = [{
                "date_obs" => "2021-08-26T17:30:00Z",
            "resultat_obs" => 506.0
        },
        {
                "date_obs" => "2021-08-26T17:30:00Z",
            "resultat_obs" => 506.0
        },
        {
                "date_obs" => "2021-08-26T17:25:00Z",
            "resultat_obs" => 507.0
        }]

    date = [] #data:
    releve = [] #labels:
      @json_data.each do |s|
        date << s["date_obs"]
        releve << s["resultat_obs"]
      end
  end

  private


  def water_data
    series_a = {
      "8": 30,
      "10": 100,
      "12": 80,
    }
    series_b = {
      "8": 100,
      "10": 10,
      "12": 8,
    }
    return [
      {name: "Station A", data: series_a, color: "orange"},
      {name: "Station B", data: series_b, color: "black"}
    ]
  end

  def rom_to_int(rom)
    roman_to_int = {  'I' => 1,
                      'II' => 2,
                      'III' => 3,
                      'IV' => 4,
                      'V' => 5,
                      'VI' => 6 }
    roman_to_int[rom]
  end

end
