# Override your default settings for the Production environment here.
#
# Example:
#   configatron.file.storage = :s3

configatron.project_name = ENV['PROJECT_NAME']

configatron.admin_user = ENV['ADMIN_USER']
configatron.admin_password = ENV['ADMIN_PASSWORD']

configatron.s3_bucket = ENV['S3_BUCKET']
configatron.s3_region = ENV['S3_REGION']
configatron.s3_access_key_id = ENV['S3_ACCESS_KEY_ID']
configatron.s3_secret_access_key = ENV['S3_SECRET_ACCESS_KEY']

configatron.metromarketing_api_url = ENV['METROMARKETING_API_URL']