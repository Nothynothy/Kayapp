class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id) # => array d'instance de fav
    if @favorites == []
      @presence = false
    else
      @presence = true
      @topos_fav = @favorites.map(&:topo) # => array d'instance de topo
    end
  end

  def create

  end

  def delete

  end
end
