class Comment < ActiveRecord::Base
  attr_accessible :content, :event_id, :user_id
  belongs_to :user, :event
end