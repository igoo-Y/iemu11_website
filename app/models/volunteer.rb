class Volunteer < ApplicationRecord
  belongs_to :user

  def self.set_dummy_datas
    30.times do |i|
      Volunteer.create(
        title: "title_#{i}",
        content: "content_#{i}",
        user_id: 1
      )
    end
  end
end