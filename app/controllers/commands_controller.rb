class CommandsController < ApplicationController
  respond_to :json, :html

  def index
    @searches = Search.last_five
  end

  def new
    redirect_to root_url if session[:user_id].nil?
    @command = Command.new
  end

  def show
    @command = Command.find_by_id params[:id]
  end

  def search
    @search = search_params[:search].gsub(/-/, ' ')
    Search.create! content: search_params[:search]
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
      redirect_to @command, notice: 'Your example was successfully created'
    else
      render :new
    end
  end

  def edit
    @command = Command.find_by_id params[:id]
  end

  def update
    @command = Command.find params[:id]
    if @command.update_attributes command_params
      redirect_to @command, notice: 'Your example was successfully updated'
    else
      render :show
    end
  end

  private
  def command_params
    params.require(:command).permit(:example, :user_id, :explanation)
  end

  def search_params
    params.permit(:search, :page, :id)
  end

end
