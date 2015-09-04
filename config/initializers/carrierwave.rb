CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAIF6WTSXOMPDQLK5A',                        # required
      :aws_secret_access_key  => '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'                        # required
  }
  config.fog_directory  = 'reviewsite-ken'                     #bucket name on AWS S3
end