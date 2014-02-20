class AddReferencesToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :user, index: true
    add_reference :jobs, :company, index: true
    add_reference :jobs, :position, index: true
  end
end
