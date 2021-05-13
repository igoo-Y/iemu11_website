class Post < ApplicationRecord
  belongs_to :board

  paginates_per 5

  has_rich_text :content
end
