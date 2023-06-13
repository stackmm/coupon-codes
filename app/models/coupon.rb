class Coupon < ApplicationRecord
  validates_presence_of :name,
                        :code,
                        :value,
                        :discount_type
  
  validates_uniqueness_of :code
  
  belongs_to :merchant
  has_many :invoices

  enum status: [:disabled, :enabled]

  def calculate_discount(price)
    if discount_type == "percent-off"
      (price * value).round(2)
    else
      [price, value].min.round(2)
    end
  end

  def times_used
    invoices.joins(:transactions).where('result = 1', invoices: {coupon_id: self.id}).distinct.count
  end
end