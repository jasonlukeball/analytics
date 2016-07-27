class User < ActiveRecord::Base

  validates :app, presence: true
  validates :email, presence: true

  belongs_to :app
  has_many :events

end
