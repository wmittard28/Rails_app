class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    #GET /projects
    def index
        @projects_created = Project.where('user_id == ?', current_user.id)
    @projects_created = @projects_created.status(Project.statuses[params[:status]]) if params[:status].present?
    @total_projects_count = @projects.length

    @projects = @projects.paginate(:page => params[:page], :per_page => 5)

    @departments = Department.all

    end

    #GET /projects/1
    def show
    end

    #GET /Projects/new
    def new
        @project = Project.new
        @departments = Department.all
    end

    #GET /projects/1/edit
    def edit
        authorize
        @departments = Department.all
        @users = User.all
    end

    #POST /projects
    def create
        @project = Project.new(project_params)
        @project.user_id = current_user.id
        @departments = Department.all
        if @project.save
            redirect_to :index
        else
            render :new
        end
    end

    #PATCH /projects/1
    def update
        authorize
        @project.user_id = current_user.id
        @departments = Department.all
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

    #DELETE /projects/1
    def destroy
        authorize
        project_id = params[:id]
        @project.destroy
        redirect_to projects_path(@project)
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :status, :description, :start_date, :end_date, :user_id)
    end

    def authorize
        if current_user != @project.user
          render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
        end
      end
    end




end
