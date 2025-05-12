# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  msg_text    :string
#  status      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chain_id    :integer
#  receiver_id :integer
#  sender_id   :integer
#
class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", counter_cache: true
  belongs_to :receiver, class_name: "User", counter_cache: :messages_rcvd_count
  belongs_to :chain, class_name: "MsgChain", counter_cache: true
end
