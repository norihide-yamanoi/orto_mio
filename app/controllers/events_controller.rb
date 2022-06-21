class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_q
def index
  @events = @q.result
end

def new
  @event = Event.new
end

def create
  @event = current_user.events.build(event_params)
  if params[:back]
    render :new
  else
    if @event.save
      redirect_to events_path, notice: "イベントを作成しました！"
    else
      render :new
    end
  end
end

def show
  @favorite = current_user.favorites.find_by(event_id: @event.id)
end

def edit
end

def update
  if @event.update(event_params)
    redirect_to events_path, notice: "イベントを編集しました！"
  else
    render :edit
  end
end

def destroy
  @event.destroy
  redirect_to events_path, notice:"イベントを削除しました！"
end

def confirm
  @event = current_user.events.build(event_params)
  render :new if @event.invalid?
end

def search
  @results = @q.result
end


private

def event_params
  params.require(:event).permit(:name, :address, :latitude, :longitude, :day, :remork,
                                :detail, :planting, :harvest, :crop, :image, :image_cache, { tag_ids: [] })
end

def set_event
  @event = Event.find(params[:id])
end

def set_q
  @q = Event.ransack(params[:q])
end
end
