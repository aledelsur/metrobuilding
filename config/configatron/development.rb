# Override your default settings for the Development environment here.
#
# Example:
#   configatron.file.storage = :local


configatron.admin_user = '1234'
configatron.admin_password = '1234'

configatron.s3_bucket = ENV['S3_BUCKET']
configatron.s3_region = ENV['S3_REGION']
configatron.s3_access_key_id = ENV['S3_ACCESS_KEY_ID']
configatron.s3_secret_access_key = ENV['S3_SECRET_ACCESS_KEY']\


configatron.logo = 'logo-metro.png'
configatron.features.newsletters = true
configatron.features.payments = false
configatron.features.client_portal = false