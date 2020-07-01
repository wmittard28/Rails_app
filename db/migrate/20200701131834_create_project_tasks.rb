class CreateProjectTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tasks do |t|
      t.references :task, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps 
    end
  end
end
