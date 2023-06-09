class CouponsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
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
    value = params[:percent] == "1" ? params[:value].to_f / 100 : params[:value].to_f
    params.permit(:name, :code, :merchant_id).merge(value: value)
  end
end