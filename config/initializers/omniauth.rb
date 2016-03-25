Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY']||'197948773916318', ENV['FACEBOOK_SECRET']||'61ae5706e7940ecb0cf674b1608965d8', scope: 'public_profile,pages_show_list,email', display: 'touch'
end