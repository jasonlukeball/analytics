class Api::V1::EventsController < Api::V1::BaseController


  def create
    @app = App.find_by(id_code: params[:app_id])
    @user = find_or_create_user
    if @app
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
      render json: { error: "App not found", status: 403 }, status: 403
    end
  end


  def find_or_create_user
    if params[:user] && params[:user][:email]
      user = User.find_or_create_by!(app: @app, email: params[:user][:email])
      if user.name.blank? && params[:user][:name]
        user.update_attribute(:name, params[:user][:name])
      end
    else
      user = nil
    end
    user
  end


  def save_event
    if @event.valid?
      @event.save!
      render json: @event, status: 201
    else
      render json: { errors: @event.errors.messages, status: 400 }, status: 400
    end
  end


  private
  def event_params
    params.require(:event).permit(:name)
  end
end