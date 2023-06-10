require "rails_helper"

RSpec.describe "Coupons Index Page", type: :feature do
  before(:each) do
    coupon_data
    visit merchant_coupons_path(@merchant1)
  end

  # User Story 1
  it "displays all of the merchant's coupons names and % off" do
    within("#coupon-#{@coupon_1.id}") do
      expect(page).to have_content(@coupon_1.name)
      expect(page).to have_content(@coupon_1.value)
    end

    within("#coupon-#{@coupon_2.id}") do
      expect(page).to have_content(@coupon_2.name)
      expect(page).to have_content(@coupon_2.value)
    end

    expect(page).to_not have_content(@coupon_6.name)
    expect(page).to_not have_content(@coupon_6.value)
  end

  it "each coupon name is a link to that coupon's show page " do
    within("#coupon-#{@coupon_1.id}") do
      expect(page).to have_link(@coupon_1.name, href: merchant_coupon_path(@merchant1, @coupon_1))
      
      click_link(@coupon_1.name)
      expect(current_path).to eq(merchant_coupon_path(@merchant1, @coupon_1))
    end

    expect(page).to_not have_link(@coupon_6.name)
  end

  # User Story 2
  it "has a link to create a new coupon" do
    expect(page).to have_link("Create New Coupon")

    click_link("Create New Coupon")
    expect(page).to have_current_path("/merchants/#{@merchant1.id}/coupons/new")
  end

  # User  Story 6
  it "displays coupons separated between inactive and active" do
    expect(page).to have_content("Active Coupons")
    expect(page).to have_content("Inactive Coupons")

    within("#active") do
      expect(page).to have_content(@coupon_1.name)
      expect(page).to have_content(@coupon_2.name)
      expect(page).to have_content(@coupon_3.name)
      expect(page).to have_content(@coupon_4.name)
      expect(page).to_not have_content(@coupon_9.name)
      expect(page).to_not have_content(@coupon_10.name) 
    end

    within("#inactive") do
      expect(page).to have_content(@coupon_9.name)
      expect(page).to have_content(@coupon_10.name)
      expect(page).to_not have_content(@coupon_1.name)
      expect(page).to_not have_content(@coupon_2.name)
      expect(page).to_not have_content(@coupon_3.name)
      expect(page).to_not have_content(@coupon_4.name)
    end
  end
end