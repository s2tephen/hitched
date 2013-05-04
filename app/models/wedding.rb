class Wedding < ActiveRecord::Base
  attr_accessible :date, :planner_id
  has_many :users, :events
end
