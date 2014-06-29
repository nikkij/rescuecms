if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  # Cloudinary.config do |config|
  #   config.cloud_name = 'hwtphffjr'
  #   config.api_key = '487578641544343'
  #   config.api_secret = 'X2IyHSXByi8P9IxJtjTqhRDneEA'
  #   config.enhance_image_tag = true
  #   config.static_image_support = false
  # end
end