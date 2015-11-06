require 'yummly'
require 'json'

Yummly.configure do |config|
  config.app_id = "edbcfcd5"
  config.app_key = "0d42cb9ca244e92e94111c5c10a59d9c"
  config.use_ssl = true # Default is false
end
