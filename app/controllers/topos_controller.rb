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

    @data = water_data
  end

  private

  def water_data
    # series_a = [["2021-08-27T08:18:00Z", 100],
    #   ["2021-05-07 00:00:00 UTC", 10],
    #   ["20.day.ago", 8],
    #   ["1789-04-29", 5],
    #   ["2021-08-27 08:18:00", 100]
    # ]
    series_a = {
      "10": 20,
      "12": 100,
      "18": 50,
      "23": 51,
    }
    series_b = {
      "9": 2,
      "10": 10,
      "11": 50,
      "20": 51,
    }
    return [
      {name: "Station A", data: series_a, color: "black"},
      {name: "Station B", data: series_b, color: "orange"}
    ]
  end

end
