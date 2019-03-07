class LocationUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
