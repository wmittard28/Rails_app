class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.errors.any?
            render :new
        else
            session[:user_id] = @user.id
            redirect_to projects_path(@projects)
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def most_active_user
        @user = User.most_active_user
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :username)
    end

end
