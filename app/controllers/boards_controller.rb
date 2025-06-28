class BoardsController < ApplicationController
  def index
    @boards = current_user.boards.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path(@board), notice: 'The post was successful!!'
    else
      flash.now[:error] = 'Post failed'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @board = current_user.boards.find(params[:id])
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to root_path, notice: 'updated!'
    else
      flash.now[:error] = 'Update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, status: :see_other, notice: 'Deleted!'
  end



  private
  def board_params
    params.require(:board).permit(:title, :description)
  end

  def set_board
    @board = Board.find(params[:id])
  end

end
