class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @topos = Topo.all
  end

  def show
    @topo = Topo.find(params[:id])
    @departure = Address.find(@topo.departure_id)
    @arrival = Address.find(@topo.arrival_id)
    comments = Comment.where(topo_id: @topo.id)
    @alerts_count = comments.where(category: "alert", active: true).count

    @topo_sites_name = ApiHubeauSiteName.call(@topo.river.name)
    @topo_sites_code = ApiHubeauCodeSite.call(@topo.river.name)

    topo_sites_levels = []
    @topo_sites_code.each do |value|
      data = ApiHubeauDataSite.call(value)
      topo_sites_levels << data
    end

    @topo_sites_levels = topo_sites_levels.flatten
  end
    # @levels =
        # codes = ApiHubeauRiverName.call('Albarine')
    # codes.each do code
    #  levels = ApiHubeauCodeSite.call(code)
      #  levels.each
    # end

  #   @graphs = [
  #   {
  #     "8": 30,
  #     "10": 100,
  #     "12": 80,
  #     "14": 50,
  #     "15": 20,
  #     "17": 110,
  #     "18": 80,
  #     "23": 82,
  #   },
  #   {
  #     "8": 30,
  #     "10": 100,
  #     "12": 80,
  #     "14": 50,
  #     "15": 20,
  #     "17": 110,
  #     "18": 80,
  #     "23": 82,
  #   },


  #   ]
  # end


end
