class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @topos = Topo.search_by_topo_and_river(params[:query])
    else
      @topos = Topo.all
    end
  end

  def toggle_favorite
    topo = Topo.find(params[:id])

    @fav = Favorite.find_by(user_id: current_user.id, topo_id: topo.id)
    if @fav
      @fav.destroy
    else
      @fav = Favorite.create(user_id: current_user.id, topo_id: topo.id)
    end
  end

  def show
    @topo = Topo.find(params[:id])
    @departure = Address.find(@topo.departure_id)
    @arrival = Address.find(@topo.arrival_id)

    comments = Comment.where(topo_id: @topo.id)
    @alerts_count = comments.where(category: "alert", active: true).count

    @favorite = Favorite.where(user_id: current_user.id, topo_id: @topo.id).exists?
    
    @topo_sites_name = ApiHubeauSiteName.call(@topo.river.name)
    @topo_sites_code = ApiHubeauCodeSite.call(@topo.river.name)
    @topo_sites_info = ApiHubeauInfoSite.call(@topo.river.name)

    topo_sites_levels = []
    @topo_sites_info.each do |value|
      data = ApiHubeauDataSite.call(value[:code])
      topo_sites_levels << data
    end
    @topo_sites_levels = topo_sites_levels.flatten



        # topo_sites_levels = []
        # @topo_sites_code.each do |value|
        #   data = ApiHubeauDataSite.call(value)
        #   topo_sites_levels << data
        #     @topo_sites_name.each do |name|
        #       @data_site = {name: name, data: topo_sites_levels.flatten }
        #   end
        # end
        # @topo_sites_levels = topo_sites_levels.flatten

  #   topo_sites_levels = []
  #   @topo_sites_code.each do |value|
  #     data = ApiHubeauDataSite.call(value)
  #     topo_sites_levels << data
  #   end
  #   @topo_sites_levels = topo_sites_levels.flatten
  # end



  # end
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

  def river_data
    @data = water_data
    render json: @data.to_json
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
