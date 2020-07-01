class AddUsernameToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :username, :string
    add_index :projects, :username, unique: true
  end
end
