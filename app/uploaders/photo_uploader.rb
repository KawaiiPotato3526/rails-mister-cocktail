# app/uploaders/photo_uploader.rb
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumnail do
    resize_to_fit 200, 200
  end
  version :show do
    resize_to_fit 550, 550
  end

  version :bright_face do
    cloudinary_transformation  width: 200, height: 200, crop: :thumb
  end
end
