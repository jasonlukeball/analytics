require 'rails_helper'

RSpec.describe App, type: :model do

  it { is_expected.to belong_to(:admin) }

end
