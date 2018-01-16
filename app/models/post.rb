class Post < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :comments, as: :commentable

  has_attached_file :picture, styles: { medium: "800x600>", thumb: "100x100>" }, default_url: "/images/picture_missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
