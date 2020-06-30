class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)

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
        if @project.update(project)
            redirect_to projects_path(@project)
        else
            render :edit
        end
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :start_date, :end_date)
    end

end


