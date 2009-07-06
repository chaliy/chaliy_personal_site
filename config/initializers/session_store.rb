# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_personalsite_session',
  :secret      => '2f384ec0bd5781a7447182c1a657c896800bab8e90f85e3d3b16c45ecaf241b6d93aae43361f94443ae328c79503074c3e20c0511dc05c048070500a66a142ca'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
