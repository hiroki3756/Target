class User::CommentsController < ApplicationController
    
    # コメントをDBに保存
    def create
        objective = Objective.find(params[:objective_id])
        comment = Comment.new(comment_params)
        comment.user_id = current_user.id
        comment.objective_id = objective.id
        if comment.save
            redirect_to user_objective_path(objective)
            flash[:notice] = "コメントを投稿しました"
        else
            redirect_to user_objective_path(objective)
        end
    end

    # コメントを削除
    def destroy
        comment = Comment.find_by(id: params[:id], objective_id: params[:objective_id])
        comment.destroy
        flash[:alert] = "コメントを削除しました"
        redirect_to user_objective_path(comment.objective_id)
    end

    private
        def comment_params
            params.require(:comment).permit(:user_id, :objective_id, :comment)
        end
end
