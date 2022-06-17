class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_to events_path, notice: "#{favorite.event.user.name}さんのイベントをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to events_path, notice: "#{favorite.event.user.name}さんのイベントをお気に入り解除しました"
  end
end
