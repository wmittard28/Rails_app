class AddPositionToJobApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :position, :string
  end 
end
