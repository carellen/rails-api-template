Apipie.configure do |config|
  config.app_name                = 'RailsApiTemplate'
  config.api_base_url            = ''
  config.doc_base_url            = '/apidoc'
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end
