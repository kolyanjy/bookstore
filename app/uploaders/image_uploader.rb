class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :small_img do
    process resize_to_fit: [200, 200]
  end

  version :medium_img do
    process resize_to_fit: [300, 300]
  end

  version :big_img do
    process resize_to_fit: [550, nil]
  end

  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
