class AppsController < ApplicationController


  def index
    @apps = App.all
  end

  def show
    @app = App.find(params[:id])
    @events = @app.events.group_by(&:name)
  end


  def new
    @app = App.new
  end


  def create
    @app = current_admin.apps.new(app_params)
    if @app.save
      flash.now[:notice] = "App successfully created!"
      redirect_to app_path(@app)
    else
      flash.now[:alert] = "App could not be saved!"
      render :new
    end
  end


  def settings
    @app = App.find(params[:id])
  end


  def update
    @app = App.find(params[:id])
    @app.assign_attributes(app_params)
    if @app.save
      flash.now[:notice] = "Changes saved!"
      redirect_to app_path(@app)
    else
      flash.now[:alert] = "App could not be updated!"
    end
  end


  def destroy
    @app = App.find(params[:id])
    if @app.destroy
      flash.now[:notice] = "App deleted!"
      redirect_to admin_root_path
    else
      flash.now[:alert] = "App could not be deleted!"
      redirect_to settings_app_path(@app)
    end
  end


  private

  def app_params
    params.require(:app).permit(:name, :url)
  end

end

