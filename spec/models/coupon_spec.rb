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
    it { should have_many :invoices }
  end

  describe 'instance methods' do
    describe '#calculate_discount' do
      it 'calculates the discount based on the value of the coupon' do
        coupon_data
        expect(@coupon_1.calculate_discount(100)).to eq(50)
        expect(@coupon_2.calculate_discount(100)).to eq(100)
        expect(@coupon_3.calculate_discount(100)).to eq(10)
        expect(@coupon_4.calculate_discount(100)).to eq(5)
        expect(@coupon_5.calculate_discount(100)).to eq(2)
      end
    end

    describe '#times_used' do
      it 'returns the number of times the coupon has been used' do
        coupon_data
        expect(@coupon_1.times_used).to eq(2)
        expect(@coupon_2.times_used).to eq(0)
        expect(@coupon_3.times_used).to eq(1)
      end
    end
  end
end