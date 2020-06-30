class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status
      t.string :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
