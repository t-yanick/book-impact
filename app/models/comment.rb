class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200,
                                                too_long: 'A comment can have a maximum of 200 characters.' }

  belongs_to :user
  belongs_to :opinion
end
