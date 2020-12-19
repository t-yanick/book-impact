# frozen_string_literal: true

class Opinion < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1000,
                                             too_long: '1000 characters in post is the maximum allowed.' }

  belongs_to :user
  has_rich_text :body
  scope :ordered_opinion, -> { order(created_at: :desc).includes(:user) }
  scope :user_filter_opinion, ->(user) { where(user: user) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
