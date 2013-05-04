class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :category
      t.text :description
      t.date :date
      t.time :time
      t.string :location
      t.text :notes
      t.integer :wedding_id

      t.timestamps
    end
  end
end
