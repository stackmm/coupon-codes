class CouponStatusController < ApplicationController
  def update
    @merchant = Merchant.find(params[:merchant_id])
    @coupon = Coupon.find(params[:id])

    if @merchant.too_many_active_coupons?
      flash[:notice] = "You cannot have more than 5 active coupons at a time."
    else
      @coupon.update(coupon_status_params)
      redirect_to merchant_coupon_path(@merchant, @coupon)
    end
  end

  private 
  def coupon_status_params
    params.permit(:status)
  end
end