class Comment < ActiveRecord::Base
  attr_accessible :content, :event_id, :user_id
  belongs_to :user
  belongs_to :event

  acts_as_readable :on => :created_at
end
