class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.text :step
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
