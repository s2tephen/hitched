class AddCompleteToEvents < ActiveRecord::Migration
  def change
    add_column :events, :complete, :boolean
  end
end
