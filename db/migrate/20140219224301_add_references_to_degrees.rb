class AddReferencesToDegrees < ActiveRecord::Migration
  def change
    add_reference :degrees, :user, index: true
    add_reference :degrees, :school, index: true
    add_reference :degrees, :specialty, index: true
  end
end
