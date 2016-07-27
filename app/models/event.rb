class Event < ActiveRecord::Base
  belongs_to :app
  belongs_to :user
end
