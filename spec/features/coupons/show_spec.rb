require "rails_helper"

RSpec.describe "Coupon Show Page", type: :feature do
  before(:each) do
    coupon_data
    visit merchant_coupon_path(@merchant1, @coupon_1)
  end

  # User Story 3
  it "displays the coupon's name, code, value and status" do
    expect(page).to have_content(@coupon_1.name)
    expect(page).to have_content(@coupon_1.code)
    expect(page).to have_content(@coupon_1.value)
    expect(page).to have_content(@coupon_1.status)

    expect(page).to_not have_content(@coupon_2.name)
  end

  it "displays a count of how many times that coupon has been used" do
    expect(page).to have_content("Times used: 2")
    
    visit merchant_coupon_path(@merchant1, @coupon_2)
    expect(page).to have_content("Times used: 0")

    visit merchant_coupon_path(@merchant1, @coupon_3)
    expect(page).to have_content("Times used: 1")
  end
end