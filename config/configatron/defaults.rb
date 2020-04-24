# Put all your default configatron settings here.

# Example:
#   configatron.emails.welcome.subject = 'Welcome!'
#   configatron.emails.sales_reciept.subject = 'Thanks for your order'
#
#   configatron.file.storage = :s3

configatron.app_url = ENV['APP_URL']
configatron.logo = ENV['LOGO']
configatron.features.newsletters = (ENV['NEWSLETTERS'] == 'true')
configatron.features.newsletters_history = (ENV['NEWSLETTERS_HISTORY'] == 'true')
configatron.features.payments = (ENV['PAYMENTS'] == 'true')
configatron.features.client_portal = (ENV['PORTAL'] == 'true')

configatron.intranet_name = 'Metro 19' # i.e: "metro_19"