class EventsController < ApplicationController

  def show
    @event        = Event.find(params[:id])
    @app          = App.find(params[:app_id])
    @events       = @app.events.where(name: @event.name).sort_by { |e| e.created_at}
    @chart_data   = @events.group_by {|e| e.created_at.to_date}.map { |k,v| [k.to_datetime.to_i * 1000, v.count]}.to_json
  end

end