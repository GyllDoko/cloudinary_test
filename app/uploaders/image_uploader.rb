class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['blog_picture']

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(200, 200)
  end
  def public_id
    return model.title
  end  
end
