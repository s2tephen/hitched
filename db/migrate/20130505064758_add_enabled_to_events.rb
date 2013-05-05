class AddEnabledToEvents < ActiveRecord::Migration
  def change
    add_column :events, :enabled, :boolean
  end
end
