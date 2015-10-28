Yummly.configure do |config|
  config.app_id = ENV["yummly_app_id"]
  config.app_key = ENV["yummly_key"]
  config.use_ssl = true # Default is false
end
