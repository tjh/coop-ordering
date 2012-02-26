Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'CONSUMER_ID', 'CONSUMER_SECRET'
  provider :facebook, 'APP_ID', 'APP_SECRET'
end