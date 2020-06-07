class User::CommentsController < ApplicationController
    
    # コメントをDBに保存
    def create
        objective = Objective.find(params[:objective_id])
        comment = Comment.new(comment_params)
        comment.user_id = current_user.id
        comment.objective_id = objective.id
        comment.save!
        redirect_to user_objective_path(objective)
    end

    # コメントを削除
    def destroy
    end

    private
        def comment_params
            params.require(:comment).permit(:user_id, :objective_id, :comment)
        end
end
