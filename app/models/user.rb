class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.email = auth["info"]["email"]
      user.headline = auth["info"]["headline"]
      user.industry = auth["info"]["industry"]
      user.location = auth["info"]["location"]
      user.image = auth["info"]["image"]
      user.public_profile = auth["info"]["public_profile"]
      # user.school_name = auth["extra"]["raw_info"]["educations"]["values"].first.schoolName
      # user.graduation_year = auth["extra"]["raw_info"]["educations"]["values"].first.endDate["year"]
      # user.field_of_study = auth["extra"]["raw_info"]["educations"]["values"].first.fieldOfStudy
    end
  end
end
