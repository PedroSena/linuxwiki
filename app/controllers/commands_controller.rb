class CommandsController < ApplicationController
  respond_to :json

  def create
    command = Command.new command_params
    if command.save
      respond_with command
    else
      render_error Error.new(:bad_request, command)
    end
  end

  private
  def command_params
    params.require(:command).permit(:example, :user_id)
  end
end
