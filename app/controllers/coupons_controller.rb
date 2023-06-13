class CouponsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    @holidays = HolidayService.new.next_three_holidays.first(3)
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @coupon = Coupon.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    coupon = Coupon.new(coupon_params)

    if @merchant.too_many_active_coupons?
      flash[:notice] = "Merchant already has five active coupons"
      redirect_to merchant_coupons_path(@merchant)
    elsif coupon.save
      redirect_to merchant_coupons_path(@merchant)
    elsif coupon.errors[:code].include?("has already been taken")
      flash[:notice] = "Coupon code already exists"
      redirect_to new_merchant_coupon_path(@merchant)
    else
      redirect_to new_merchant_coupon_path(@merchant)
      flash[:notice] = "All fields must be completed"
    end
  end

  private
  def coupon_params
    params.permit(:name, :code, :value, :discount_type, :merchant_id)
  end
end