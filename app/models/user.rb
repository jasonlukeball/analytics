class User < ActiveRecord::Base

  validates :app, presence: true
  validates :email, presence: true

  after_create :update_last_seen_at

  belongs_to :app
  has_many :events

  default_scope { order('last_seen_at DESC') }

  def update_name(name)
    update_attribute(:name, name)
  end

  def update_last_seen_at
    update_attribute(:last_seen_at, Time.now)
  end

  def update_web_sessions
    increment(:web_sessions) if Time.now > self.last_seen_at + 30.minutes || self.web_sessions == 0
  end

end
