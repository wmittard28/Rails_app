class Task < ActiveRecord::Base
    has_many :project_tasks, inverse_of: :task
    has_many :projects, through: project_tasks
    validates :name, uniqueness: true 
end
