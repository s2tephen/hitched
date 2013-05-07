class Event < ActiveRecord::Base
  attr_accessible :category, :date, :description, :location, :name, :notes, :time, :wedding_id, :complete
  has_many :comments
  belongs_to :wedding
end
