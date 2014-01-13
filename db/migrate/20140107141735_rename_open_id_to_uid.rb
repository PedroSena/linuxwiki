class RenameOpenIdToUid < ActiveRecord::Migration
  def change
    rename_column :users, :openID, :uid
  end
end
