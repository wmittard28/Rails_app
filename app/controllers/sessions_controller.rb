class SessionsController < ApplicationController

    def new
        if current_user
            redirect_to current_user
        end
    end

    def create
           @user = User.find_by(:username => params[:user][:username])
          if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_url(@user)
           else
            flash[:error] = "Username and/or Password are invalid, please try again."
            redirect_to signin_url
        end
    end

        def omnilogin
            @user = User.from_omniauth(auth)
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        end




    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env["omniauth.auth"]
    end


end
