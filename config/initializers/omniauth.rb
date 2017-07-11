require "omniauth-google-oauth2"

Tokite::Engine.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    hd: ENV["GOOGLE_HOSTED_DOMAIN"].present? ? ENV["GOOGLE_HOSTED_DOMAIN"] : nil,
  }
end
