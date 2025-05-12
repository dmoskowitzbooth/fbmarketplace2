# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  rating         :integer
#  text           :string
#  would_to_again :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  author_id      :integer
#  item_id        :integer
#  user_about_id  :integer
#
class Review < ApplicationRecord
  belongs_to :author, class_name: "User", counter_cache: true
  belongs_to :user, foreign_key: "user_about_id", counter_cache: :reviews_about_count
  belongs_to :item, counter_cache: true
end
