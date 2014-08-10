# Test and Dev
if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

Cloudinary.config do |config|
  config.cloud_name = 'hwtphffjr'
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  config.enhance_image_tag = true
  config.static_image_support = true  
end