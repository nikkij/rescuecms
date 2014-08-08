# Test and Dev
if Rails.env.test? or Rails.env.cucumber?
  Cloudinary.config do |config|
    config.cloud_name = 'hwtphffjr'
    config.api_key = Rails.application.secrets.CLOUDINARY_API_KEY
    config.api_secret = Rails.application.secrets.CLOUDINARY_API_SECRET
    config.enhance_image_tag = true
    config.static_image_support = false
  end
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.development?
  Cloudinary.config do |config|
    config.cloud_name = 'hwtphffjr'
    config.api_key = Rails.application.secrets.CLOUDINARY_API_KEY
    config.api_secret = Rails.application.secrets.CLOUDINARY_API_SECRET
    config.enhance_image_tag = true
    config.static_image_support = false
  end
end

# Production
if Rails.env.production?
  Cloudinary.config do |config|
    config.cloud_name = 'hwtphffjr'
    config.api_key = ENV['CLOUDINARY_API_KEY']
    config.api_secret = ENV['CLOUDINARY_API_SECRET']
    config.enhance_image_tag = true
    config.static_image_support = true  
  end
end