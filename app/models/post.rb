class Post < ApplicationRecord
  belongs_to :board

  has_rich_text :content

  def self.set_dummy_datas
    30.times do |i|
      Post.create(
        title: "title_#{i}",
        content: "content_#{i}",
        board_id: [1, 7, 8].sample,
        user_id: 1
      )
    end
  end
end
