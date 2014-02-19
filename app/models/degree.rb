class Degree < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  belongs_to :specialty
end
