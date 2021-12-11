class Post < ApplicationRecord
  validates :title, :content, :tag, length: {minimum: 1}
  belongs_to :user
  mount_uploader :image, ImageUploader      
end
