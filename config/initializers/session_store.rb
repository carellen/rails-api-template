Rails.application.config.session_store :cookie_store, key: '_api-template_session'
Rails.application.config.session_store :cookie_store, expire_after: 5.days