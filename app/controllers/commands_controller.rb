class CommandsController < ApplicationController
  respond_to :json, :html

  before_filter :root_redirect, only: [:new, :create]

  def index
    @searches = Search.with_results.last(5).reverse
    @commands = Command.last(5).reverse
  end

  def new
    @command = Command.new
  end

  def show
    @command = Command.friendly.find params[:id]
  end

  def search
    searched = search_params[:search]
    @search = searched.gsub(/-/, ' ')
    @commands = Command.search @search, page: search_params[:page], per_page: 5, sql: {include: :user}
    Search.create content: searched, found_something: ! @commands.empty?
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

  def root_redirect
    redirect_to root_url if session[:user_id].nil?
  end

end
