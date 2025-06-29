class CommentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end


  private

  def comment_param
    params.require(:comment).permit(:content)
  end
end
