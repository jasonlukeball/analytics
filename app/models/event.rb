class Event < ActiveRecord::Base
  belongs_to :app
  belongs_to :user

  validates :app, presence: true
  validates :name, presence: true

  default_scope { order('created_at DESC') }

end
