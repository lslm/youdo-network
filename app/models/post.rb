class Post < ApplicationRecord
  searchkick
  belongs_to :user
end
