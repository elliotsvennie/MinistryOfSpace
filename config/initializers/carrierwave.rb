require 'fog/aws'

CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS', 
    aws_access_key_id:     Rails.application.secrets.aws_key,
    aws_secret_access_key: Rails.application.secrets.aws_secret,
    region:                'eu-west-1'
  }
  config.fog_directory  = Rails.application.secrets.aws_bucket
end