class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small_img do
    process resize_to_fit: [150, 200]
  end

  version :medium_img do
    process resize_to_fit: [225, 300]
  end

  version :big_img do
    process resize_to_fit: [550, 733]
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/default.png')
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
