class Post < ApplicationRecord
  has_many_attached :pictures
  belongs_to :user
  has_many :comments
end
