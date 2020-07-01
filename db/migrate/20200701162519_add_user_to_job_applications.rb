class AddUserToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_applications, :user, null: true, foreign_key: true
  end
end
