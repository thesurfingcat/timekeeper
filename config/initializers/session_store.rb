# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_timekeeper_session',
  :secret      => '002492c42a035a43e009631ab335e685425daed28507d35980fb6eb0c0dc7d0e1c9334d2cdad3445d7edf6656651e37edcee118ea3915d2120cdc34b22241164'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
