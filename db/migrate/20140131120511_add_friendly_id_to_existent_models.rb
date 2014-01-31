class AddFriendlyIdToExistentModels < ActiveRecord::Migration
  def change
    Command.find_each(&:save)
  end
end
