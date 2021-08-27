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
  end

  private

  def water_data
    series_a = {
      "8": 30,
      "10": 100,
      "12": 80,
      "14": 50,
      "15": 20,
      "17": 110,
      "18": 80,
      "23": 82,
    }
    series_b = {
      "8": 100,
      "10": 10,
      "12": 8,
      "14": 5,
      "15": 2,
      "17": 10,
      "18": 50,
      "23": 51,
    }
    return [
      {name: "Station A", data: series_a, color: "black"},
      {name: "Station B", data: series_b, color: "orange"}
    ]
  end

end
