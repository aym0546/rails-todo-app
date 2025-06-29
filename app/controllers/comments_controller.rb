class CommentsController < ApplicationController
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build
  end

  def create
    @task = Task.find(params[:task_id])
    @comment = current_user.comments.build(comment_param)
    @comment.task = @task
    if @comment.save
      redirect_to task_path(@task), notice: 'Added comment!'
    else
      flash.now[:error] = 'Comment could not be submitted'
      render :new
    end
  end


  private

  def comment_param
    params.require(:comment).permit(:content, :task_id)
  end
end
