class TasksController < ApplicationController
    def index
        @tasks = Task.order("name ASC")
      end

      def show
        @task = Task.find_by_id(params[:id])
        @projects = Project.joins(:tasks).where("tasks.id = ? ", task)
        flash.now[:primary] = "Showing all projects containing #{task.name}."
        render 'projects/index'
      end
    end

end
