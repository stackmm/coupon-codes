class ChangeMerchantIdReferenceInCoupon < ActiveRecord::Migration[7.0]
  def change
    change_column :coupons, :merchant_id, :bigint, null: true
  end
end
