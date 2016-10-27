OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 
  	Rails.application.secrets.google_oauth_client_id, 
  	Rails.application.secrets.googe_outh_client_secret, {
  	access_type: 'online',
	:name => "google_oauth2",
	:scope => "email, profile",
	:prompt => "select_account",
	:image_aspect_ratio => "square",
	:image_size => 50,  	
  	client_options: {
  		ssl: {
  			ca_file: Rails.root.join("cacert.pem").to_s
  		}
  	}
  }
end