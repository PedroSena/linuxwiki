class CommandsController < ApplicationController
  respond_to :json, :html

  def index
  end

  def new
    redirect_to root_url if session[:user_id].nil?
    @command = Command.new
  end

  def show
    @command = Command.find search_params[:id]
  end

  def search
    @search = search_params[:search].gsub(/-/, ' ')
    @commands = Command.search @search, page: search_params[:page], per_page: 5, sql: {include: :user}
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @command = Command.new command_params
    @command.user_id = session[:user_id]
    if @command.save
      flash[:notice] = 'Example created. It will be available in some minutes'
      respond_with @command
    else
      render_error HttpError.new(:bad_request, @command)
    end
  end

  def update
    @command = Command.find params[:id]
    if @command.update_attributes command_params
      respond_with @command
    else
      render_error HttpError.new(:bad_request, @command)
    end
  end

  private
  def command_params
    params.require(:command).permit(:example, :user_id, :description)
  end

  def search_params
    params.permit(:search, :page, :id)
  end

end
