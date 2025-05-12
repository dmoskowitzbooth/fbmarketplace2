# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  account_status         :string
#  address                :string
#  birthday               :date
#  buyer_status           :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  items_count            :integer
#  messages_count         :integer
#  messages_rcvd_count    :integer
#  msg_chains_count       :integer
#  msg_chains_rcvd_count  :integer
#  offers_count           :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  reviews_about_count    :integer
#  reviews_count          :integer
#  sales_buyer_count      :integer
#  sales_count            :integer
#  seller_status          :string
#  verification           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :items, foreign_key: "seller_id", dependent: :destroy
  has_many  :messages, foreign_key: "sender_id", dependent: :destroy
  has_many  :msg_chains, foreign_key: "sender_id", dependent: :nullify
  has_many  :offers, foreign_key: "submitter_id", dependent: :nullify
  has_many  :reviews, foreign_key: "author_id", dependent: :nullify
  has_many  :reviews_about, class_name: "Review", foreign_key: "user_about_id", dependent: :destroy
  has_many  :sales, foreign_key: "seller_id"
  has_many  :sales_buyer, class_name: "Sale", foreign_key: "buyer_id"
  has_many  :messages_rcvd, class_name: "Message", foreign_key: "receiver_id"
  has_many  :msg_chains_rcvd, class_name: "MsgChain", foreign_key: "receiver_id"
end
