# == Schema Information
#
# Table name: sales
#
#  id                :bigint           not null, primary key
#  final_price       :float
#  pu_date           :datetime
#  pu_location       :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  accepted_offer_id :integer
#  buyer_id          :integer
#  item_id           :integer
#  seller_id         :integer
#
class Sale < ApplicationRecord
  belongs_to :seller, class_name: "User", counter_cache: true
  belongs_to :buyer, class_name: "User", counter_cache: :sales_buyer_count
  belongs_to :item
  belongs_to :accepted_offer, class_name: "Offer"
end
