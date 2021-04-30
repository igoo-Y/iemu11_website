class Match < ApplicationRecord
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  require 'carrierwave/orm/activerecord'
end