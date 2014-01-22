class AddFoundToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :found_something, :boolean, default: false
  end
end
