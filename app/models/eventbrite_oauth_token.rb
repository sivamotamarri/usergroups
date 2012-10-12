class EventbriteOauthToken < ActiveRecord::Base
stampable
belongs_to :user
attr_accessible :user_id, :email_id, :event_brite_token
end