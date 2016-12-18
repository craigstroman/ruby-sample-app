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

  provider :facebook, 
    Rails.application.secrets.facebook_oauth_key, 
    Rails.application.secrets.facebook_outh_secret, {
    :secure_image_url => 'true',
    :image_size => 'original',
    :authorize_params => {
      :force_login => 'true',
      :lang => 'en'
    },
    client_options: {
      ssl: {
        ca_file: Rails.root.join("cacert.pem").to_s
      }
    }
  }    

  provider :twitter, 
    Rails.application.secrets.twitter_oauth_key, 
    Rails.application.secrets.twitter_outh_secret, {
    :secure_image_url => 'true',
    :image_size => 'original',
    :authorize_params => {
      :force_login => 'true',
      :lang => 'en'
    },
    client_options: {
      ssl: {
        ca_file: Rails.root.join("cacert.pem").to_s
      }
    }
  }  
end