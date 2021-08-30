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
    @topo_sites_info = ApiHubeauInfoSite.call(@topo.river.name)

    topo_sites_levels = []
      @topo_sites_info.each do |value|
        data = ApiHubeauDataSite.call(value[:code])
        topo_sites_levels << data
      end
      @topo_sites_levels = topo_sites_levels.flatten



    end


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

end
