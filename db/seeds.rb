# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
InvoiceItem.destroy_all
Transaction.destroy_all
Invoice.destroy_all
Item.destroy_all
Merchant.destroy_all
Customer.destroy_all

Rake::Task["csv_load:all"].invoke

@coupon_1 = Coupon.create!(name: "Half Off", code: "HALFOFF", value: 0.5, discount_type: "percent-off", merchant_id: 1)
@coupon_2 = Coupon.create!(name: "OMG it's FREE!", code: "FULLOFF", value: 1.0, discount_type: "percent-off", merchant_id: 1)
@coupon_3 = Coupon.create!(name: "10% Off", code: "TENOFF", value: 0.10, discount_type: "percent-off", merchant_id: 1)
@coupon_4 = Coupon.create!(name: "Five Dollars Off!", code: "5OFF", value: 5, discount_type: "dollars-off", merchant_id: 1)
@coupon_5 = Coupon.create!(name: "Two Dollars Off!", code: "2OFF", value: 2, discount_type: "dollars-off", merchant_id: 3)
@coupon_6 = Coupon.create!(name: "Ten Dollars Off!", code: "10OFF", value: 10, discount_type: "dollars-off", merchant_id: 2)
@coupon_7 = Coupon.create!(name: "50% Off!", code: "50%OFF", value: 0.5, discount_type: "percent-off", merchant_id: 2)
@coupon_8 = Coupon.create!(name: "Three Bucks Off!", code: "3OFF", value: 3, discount_type: "dollars-off", merchant_id: 2)
@coupon_9 = Coupon.create!(name: "Twenty Percent Off!", code: "20%OFF!", value: 0.20, discount_type: "percent-off", merchant_id: 1, status: 0)
@coupon_10 = Coupon.create!(name: "The $5 SALE", code: "GIANT5", value: 5, discount_type: "dollars-off", merchant_id: 1, status: 0)
@coupon_11 = Coupon.create!(name: "The $10 SALE", code: "GIANT10", value: 10, discount_type: "dollars-off", merchant_id: 2, status: 0)