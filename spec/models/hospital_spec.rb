require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many :doctors }
    it { should have_many(:patients).through(:doctors) }
  end
end
