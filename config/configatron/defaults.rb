# Put all your default configatron settings here.

# Example:
#   configatron.emails.welcome.subject = 'Welcome!'
#   configatron.emails.sales_reciept.subject = 'Thanks for your order'
#
#   configatron.file.storage = :s3

configatron.app_url = ENV['APP_URL']
configatron.logo = ENV['LOGO']
configatron.features.newsletters = ENV['NEWSLETTERS']
configatron.features.newsletters_history = ENV['NEWSLETTERS_HISTORY']
configatron.features.payments = ENV['PAYMENTS']
configatron.features.client_portal = ENV['PORTAL']
configatron.features.budget_rates = ENV['BUDGET_RATES']
configatron.http_domain = '.buildit.com.ar'