require Rails.root.join('lib/omniauth/strategies/doorkeeper')

Rails.application.config.middleware.use OmniAuth::Builder do
  setting = Setting.first
  provider :doorkeeper, setting.oauth_id, setting.oauth_secret, callback_path: '/app/auth/doorkeeper/callback'
end
