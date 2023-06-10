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

  # User Story 4
  it "has a button to disable the coupon" do
    expect(page).to have_content("Status: enabled")
    expect(page).to have_button("Deactivate")
  end

  it "can disable a coupon and return to the show page" do
    expect(page).to have_content("Status: enabled")

    click_button("Deactivate")
    expect(page).to have_current_path(merchant_coupon_path(@merchant1, @coupon_1))
    expect(page).to have_content("Status: disabled")
  end
end