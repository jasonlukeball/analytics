class App < ActiveRecord::Base

  belongs_to :admin
  has_many :users, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :url,  presence: true

  after_create  :generate_app_id

  default_scope { order('name ASC') }

  def generate_app_id
    loop do
      id_code = ("a".."z").to_a.sample + SecureRandom.uuid[0,5]
      return update_attribute(:id_code, id_code) unless App.exists?(id_code: id_code)
    end
  end


end
