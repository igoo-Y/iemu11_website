class Post < ApplicationRecord
  belongs_to :board

  paginates_per 3
end
