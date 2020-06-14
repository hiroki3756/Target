class User::UsersController < ApplicationController
    # ユーザー一覧の表示
    def index
        @users = User.all
        @search = User.ransack(params[:q])
        @results = @search.result 
    end
    
    # ユーザー詳細の表示
    def show
        @user = User.find(params[:id])
        @q = Objective.ransack(params[:q])
        @objectives = @q.result(distinct: true).page(params[:page])
        if params[:tag_name]
            @objectives = Objective.tagged_with("#{params[:tag_name]}")
        end
    end

    # ユーザー情報編集画面の表示
    def edit
        @user = User.find(params[:id])
    end

    # ユーザー情報を更新
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "ユーザー情報を更新しました"
            redirect_to user_user_path
        else
            render :edit
        end
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
