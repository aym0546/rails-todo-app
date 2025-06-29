class CommentsController < ApplicationController
before_action :set_task

  def new
    @comment = @task.comments.build
  end

  def create
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

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_param
    params.require(:comment).permit(:content, :task_id)
  end
end
