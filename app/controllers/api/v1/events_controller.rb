class Api::V1::EventsController < Api::V1::BaseController

  before_filter :set_access_control_headers


  def preflight
    head 200
  end


  def set_access_control_headers
    # set CORS headers so controller actions will allow POST requests from other domains
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end


  def create

    Rails.logger.info "=============== <HTTP ORIGIN> ==============="
    Rails.logger.info request.env['HTTP_ORIGIN']
    Rails.logger.info "=============== </HTTP ORIGIN> ==============="


    @app = App.find_by(id_code: params[:app_id])
    if @app # TODO && request.env['HTTP_ORIGIN'] == @app.url
      @user = find_or_create_user
      if @user
        # ASSOCIATE EVENT WITH USER AND APP
        @event = @user.events.build(event_params)
        @event.app = @app
        save_event
      else
        # ASSOCIATE EVENT WITH APP ONLY
        @event = @app.events.build(event_params)
        save_event
      end
    else
      render json: "Unknown application", status: :unprocessable_entity
    end
  end


  def find_or_create_user
    if params[:user] && params[:user][:email]
      user = User.find_or_create_by!(app: @app, email: params[:user][:email])
      user.update_name(params[:user][:name])
      user.update_web_sessions
      user.update_last_seen_at
    else
      user = nil
    end
    user
  end


  def save_event
    if @event.save
      render json: @event, status: :created
    else
      render json: { errors: @event.errors.messages }, status: :unprocessable_entity
    end
  end


  private
  def event_params
    params.require(:event).permit(:name)
  end
end