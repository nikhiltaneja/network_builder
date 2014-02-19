OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET'],
    :scope => 'r_fullprofile r_emailaddress',
    :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "educations", "three-current-positions", "three-past-positions", "interests", "skills", "distance", "summary"]
end
