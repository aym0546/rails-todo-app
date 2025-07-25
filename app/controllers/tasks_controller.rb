class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @board = Board.find(params[:board_id])
    @task = @board.tasks.build
  end

  def create
    @board = Board.find(params[:board_id])
    @task = current_user.tasks.build(task_params)
    @task.board = @board
    if @task.save
      redirect_to task_path(@task), notice: 'The post was successful!!'
    else
      flash.now[:error] = 'Post failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comments = @task.comments
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @board = @task.board
  end

  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task), notice: 'updated!'
    else
      flash.now[:error] = 'Update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    board = task.board
    task.destroy!
    redirect_to board_path(board), status: :see_other, notice: 'Deleted!'
  end



  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :eyecatch, :board_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
