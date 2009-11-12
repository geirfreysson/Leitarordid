# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_leitarordid_session',
  :secret      => 'a3557c759afc24e2f8e83bd10ef85bb02a658bbad36abc84d82f6c11b43996c6dd12c547ca515ccf43359830ed0b448236c97c9eb12b5162a4416d82052e0e71'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
