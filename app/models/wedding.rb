class Wedding < ActiveRecord::Base
  attr_accessible :date, :planner_id
  has_many :users
  has_many :events


  def incomplete_events
    events.where(complete: false)
  end

  def complete_events
    events.where(complete: true)
  end
end
