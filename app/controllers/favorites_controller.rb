class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id) # => array d'instance de fav

      @topos_fav = @favorites.map(&:topo) # => array d'instance de topo
      @rivers_fav = @topos_fav.map(&:river) # => array d'instance de river
      @topos_fav_river_name = @rivers_fav.map(&:name)

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
