class User < ActiveRecord::Base
  has_many :degrees

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = create! do |user|
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
    end

    educations = auth["extra"]["raw_info"]["educations"]["values"]
    add_degree(educations, user.id)
    user
  end

  def self.add_degree(educations, user_id)
    educations.each do |education|
      specialty = Specialty.find_or_create_by(name: education.fieldOfStudy)
      school = School.find_or_create_by(name: education.schoolName)
      Degree.create(title: education.degree, user_id: user_id, specialty_id: specialty.id, school_id: school.id)
    end
  end
end
