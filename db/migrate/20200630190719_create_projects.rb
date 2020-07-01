class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.string :description
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
