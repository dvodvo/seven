class Articlephoto < ApplicationRecord
  # has_one_attached :photo
  mount_uploader :photo, PhotoUploader
end
