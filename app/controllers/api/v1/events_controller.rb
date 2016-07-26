class Api::V1::EventsController < Api::V1::BaseController

  def create
  end

  private
  def event_params
    params.require(:event).permit(:name)
  end

end