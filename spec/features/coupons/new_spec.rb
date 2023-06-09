require "rails_helper"

RSpec.describe "New Coupon Page", type: :feature do
  before(:each) do
    coupon_data
    visit new_merchant_coupon_path(@merchant1)
  end

  # User Story 2
  it "has a form to create a new coupon" do
    fill_in "Name", with: "The BIG Sale"
    fill_in "Code", with: "BIGSALEWOW"
    fill_in "Value", with: 25
    check "percent"
    click_button "Submit"

    expect(page).to have_current_path(merchant_coupons_path(@merchant1))

    within("#coupon-#{Coupon.last.id}") do
      expect(page).to have_content("The BIG Sale")
      expect(page).to have_content(25)
    end
  end

  it "displays a flash message if all fields are not completed" do
    fill_in "Code", with: "BIGSALEWOW"
    fill_in "Value", with: 25
    check "percent"
    click_button "Submit"

    expect(page).to have_current_path(new_merchant_coupon_path(@merchant1))
    expect(page).to have_content("All fields must be completed")
  end

  it "displays a flash message if the coupon code already exists" do
    fill_in "Name", with: "The BIG Sale"
    fill_in "Code", with: "HALFOFF"
    fill_in "Value", with: 25
    check "percent"
    click_button "Submit"

    expect(page).to have_current_path(new_merchant_coupon_path(@merchant1))
    expect(page).to have_content("Coupon code already exists")
  end

  it "displays a flash message if the merchant already has five active coupons" do
    fill_in "Name", with: "The BIG Sale"
    fill_in "Code", with: "BIGSALEWOW"
    fill_in "Value", with: 25
    check "percent"
    click_button "Submit"

    visit new_merchant_coupon_path(@merchant1)

    fill_in "Name", with: "Thanksgiving SALE"
    fill_in "Code", with: "TENDOLLARS"
    fill_in "Value", with: 10
    click_button "Submit"

    expect(page).to have_current_path(merchant_coupons_path(@merchant1))
    expect(page).to have_content("Merchant already has five active coupons")
  end
end