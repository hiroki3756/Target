class User::UsersController < ApplicationController
    # ユーザー一覧の表示
    def index
        @users = User.all
    end
    
    # ユーザー詳細の表示
    def show
        @user = User.find(params[:id])
        @objectives = @user.objectives
    end

    # ユーザー情報編集画面の表示
    def edit
        @user = User.find(params[:id])
    end

    # ユーザー情報を更新
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_user_path
    end

    # フォローしてるユーザーの一覧の表示
    def following
        @user  = User.find(params[:id])
        @users = @user.followings
        render 'show_follow'
    end

    # フォローされてるユーザーの一覧の表示
    def followers
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follower'
    end


    private
        def user_params
            params.require(:user).permit(:name, :introduction, :profile_image)
        end
end
