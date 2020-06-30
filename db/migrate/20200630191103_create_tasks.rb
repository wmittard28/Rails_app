class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.date :due_date

      t.timestamps 
    end
  end
end
