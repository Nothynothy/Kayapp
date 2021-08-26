class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def show
    @topo = Topo.find(params[:id])
    @departure = Address.find(@topo.departure_id)
    @arrival = Address.find(@topo.arrival_id)
    comments = Comment.where(topo_id: @topo.id)
    @alerts_count = comments.where(category: "alert", active: true).count
  end

  def index
    @topos = Topo.all
  end
end
