class Coupon < ApplicationRecord
  validates_presence_of :name,
                        :code,
                        :value
  
  validates_uniqueness_of :code
  
  belongs_to :merchant
  has_one :invoice
end