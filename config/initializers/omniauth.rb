require Rails.root.join('lib/omniauth/strategies/doorkeeper')

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :doorkeeper, ENV['OAUTH_ID'], ENV['OAUTH_SECRET'], callback_path: '/app/auth/doorkeeper/callback'
end
