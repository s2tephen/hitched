class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.date :date
      t.integer :planner_id

      t.timestamps
    end
  end
end
