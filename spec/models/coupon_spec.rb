require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :code }
    it { should validate_presence_of :value }
    it { should validate_uniqueness_of :code }
  end

  describe 'relationships' do 
    it { should belong_to :merchant }
    it { should have_one :invoice }
  end
end