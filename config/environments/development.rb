FryFarmsCoop::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the webserver when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_view.debug_rjs             = true
  config.action_controller.perform_caching = false

  config.action_mailer.smtp_settings = {
    :address              => ENV['SMTP_HOST'],
    :port                 => ENV['SMPT_PORT'],
    :domain               => ENV['SMTP_DOMAIN'],
    :authentication       => :plain,
    :enable_starttls_auto => true,
    :user_name            => ENV['SMTP_USER'],
    :password             => ENV['SMTP_PASSWORD']
  }

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  config.action_mailer.delivery_method = :letter_opener
end

