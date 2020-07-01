class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.integer :category
      t.string :name
      t.integer :status
      t.string :description
      t.date :start_date
      t.date :due_date

      t.timestamps
    end
  end
end
