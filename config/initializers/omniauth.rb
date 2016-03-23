Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '197017177342811', 'ab466e430fd773a4faa4d7cbd7fed7f0', scope: 'public_profile,pages_show_list', display: 'touch'
end