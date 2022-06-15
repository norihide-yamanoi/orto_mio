class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

def index
  @events = Event.all
end

def new
  @event = Event.new
end

def create
  @event = Event.new(event_params)
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
  @event = Event.new(event_params)
  render :new if @event.invalid?
end


private

def event_params
  params.require(:event).permit(:name, :address, :latitude, :longitude, :day, :remork,
                                :detail, :planting, :harvest, :crop, :image, :image_cache)
end

def set_event
  @event = Event.find(params[:id])
end

end