require 'rails_helper'

RSpec.describe App, type: :model do

  it { is_expected.to belong_to(:admin) }
  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:events) }

end
