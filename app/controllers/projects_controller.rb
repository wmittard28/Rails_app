class ProjectsController < ApplicationController
    before_action :find_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all.order("created_at DESC")
    end

    def new
        @project = Project.new
        @project.project_tasks.build.build_task
        @project.notes.build
    end

    def create
        @project = Project.new(project_params)
        @project.user = current_user

        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @project.update(project_params)
            redirect_to projects_path(@project)
        else
            render :edit
        end
    end

    def destroy
        @project.destroy
        redirect_to project_path
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :start_date, :due_date,
        project_tasks_attributes: [:id, :task_name, :_destroy],
        notes_attributes: [:id, _destroy])
    end

    def find_project
        @project = Project.find(params[:id])
    end

end
