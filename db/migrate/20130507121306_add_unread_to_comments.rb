class AddUnreadToComments < ActiveRecord::Migration
  def change
    add_column :comments, :unread, :boolean
  end
end
