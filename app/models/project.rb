class Project < ActiveRecord::Base
    belongs_to :user
    has_many :project_tasks, inverse_of: :project, dependent: :destroy
    has_many :tasks, through: :project_tasks
    has_many :notes, dependent: :destroy

    accepts_nested_attributes_for :notes, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :project_tasks, :reject_if => :all_blank, :allow_destroy => true

    validates :name, :description, :start_date, :due_date, :project_tasks, :notes, presence: true

    scope :by_task, -> (task) { joins(:tasks).where("tasks.name = ?", task) }









end
