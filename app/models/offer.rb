# == Schema Information
#
# Table name: offers
#
#  id           :bigint           not null, primary key
#  notes        :string
#  offer        :float
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  item_id      :integer
#  submitter_id :integer
#
class Offer < ApplicationRecord
  belongs_to :submitter, class_name: "User", counter_cache: true
  belongs_to :item, counter_cache: true
  has_many  :sales, foreign_key: "accepted_offer_id"
end
