class AddCompanyToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_reference :job_applications, :company, null: true, foreign_key: true
  end
end
