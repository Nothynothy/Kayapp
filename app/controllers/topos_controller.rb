class ToposController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def show

  end

  def index
    @topos = Topo.all
  end

end
