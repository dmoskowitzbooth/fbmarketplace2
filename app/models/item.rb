# == Schema Information
#
# Table name: items
#
#  id                :bigint           not null, primary key
#  address           :string
#  asking_price      :float
#  category          :string
#  description       :text
#  image             :string
#  latitude          :float
#  longitude         :float
#  msg_chains_count  :integer
#  name              :string
#  offers_count      :integer
#  og_purchase_price :float
#  reviews_count     :integer
#  sale_type         :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  seller_id         :integer
#
class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", counter_cache: true
  has_many  :offers, dependent: :destroy
  has_many  :msg_chains, dependent: :nullify
  has_many  :sales
  has_many  :reviews
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
