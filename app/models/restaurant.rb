class Restaurant < ActiveRecord::Base

  has_many :reviews

  mount_uploader :image, ImageUploader

end
