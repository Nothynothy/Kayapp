class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id) # => array d'instance de fav
    if @favorites == []
      @presence = false
    else
      @presence = true
      @topos_fav = @favorites.map(&:topo) # => array d'instance de topo
      @rivers_fav = @topos_fav.map(&:river) # => array d'instance de river

      # user_topos = current_user.topos
      # user_topos.each do |topo|
      #   @fav_topo_river = topo.river.name
      # end
    end
  end

  def delete
    favorite = Favorite.find(user_id: params[:user_id], topo_id: params[:topo_id])
    favorite.destroy
  end

  private

  def params_topo
    params.permit(:topo_id)
  end
end
