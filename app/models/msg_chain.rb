# == Schema Information
#
# Table name: msg_chains
#
#  id             :bigint           not null, primary key
#  messages_count :integer
#  subject        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_id        :integer
#  receiver_id    :integer
#  sender_id      :integer
#
class MsgChain < ApplicationRecord
  belongs_to :sender, class_name: "User", counter_cache: true
  belongs_to :receiver, class_name: "User", counter_cache: :msg_chains_rcvd_count
  belongs_to :item, counter_cache: true
  has_many  :messages, foreign_key: "chain_id", dependent: :destroy
end
