class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @topo = Topo.find(params[:id])
  end

  def index
    @topos = Topo.all
  end

end
