class ProjectTask < ActiveRecord::Base
    belongs_to :task
    belongs_to :project, counter_cache: true

    accepts_nested_attributes_for :task, :reject_if => :all_blank, :allow_destroy => true

    def task_name
        self.task.name if !self.id.nil?
      end

      def task_name=(name)
        @task = Task.find_or_create_by(name: name)
        self.task = @task
      end

end
