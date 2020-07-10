class User::ObjectivesController < ApplicationController
    # 個々のユーザーの目標の一覧を表示
    def index
        @objectives = Objective.where(user_id: current_user)
        @comments = Comment.all
    end

    # 目標の詳細を表示
    def show
        @objective = Objective.find(params[:id])
        @comment = Comment.new(objective_id: @objective.id)
        @comments = Comment.where(objective_id: @objective.id) 
    end

    # 目標投稿画面を表示
    def new
        @objective = Objective.new
    end

    # 目標をDBに保存
    def create
        user = current_user
        @objective = Objective.new(objective_params)
        @objective.user_id = current_user.id
        if @objective.save
            flash[:notice] = "目標を投稿しました"
            redirect_to user_user_path(user)
        else
            render :new
        end
    end

    # 目標の編集画面を表示
    def edit
        @objective = Objective.find(params[:id])
    end

    # 目標を更新する
    def update
        @objective = Objective.find(params[:id])
        if @objective.update(objective_params)
            flash[:notice] = "目標を更新しました"
            redirect_to user_objective_path(@objective)
        else
            render :edit
        end
    end

    # 目標を削除する
    def destroy
        objective = Objective.find(params[:id])
        user = objective.user
        objective.destroy
        flash[:alert] = "目標を削除しました"
        redirect_to user_user_path(user)
    end

    private
        def objective_params
            params.require(:objective).permit(:title, :explain, :user_id, :category_id, :comment_id, :achievement, :tag_list)
        end

end
