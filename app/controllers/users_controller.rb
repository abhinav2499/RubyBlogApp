class UsersController < ApplicationController
    def new
        @user = User.new(user_params)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome #{@user.username}!"
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Account updated successfully!"
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end