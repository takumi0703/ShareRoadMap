class CommentController < ApplicationController
  before_action :autheniticate_user, { only: [:new,:edit,:update,:destroy] }
  before_action :not_set_current_user_comment, { only: [:edit] }
  def new
    @comment = Comment.new
    @study = Study.find(params[:id])
  end

  def create
    @comment = @current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました！'
      redirect_to(comment_index_path)
    else
      flash[:alert] = 'コメントに不備があります'
      redirect_to(comment_new_path(@comment.study_id))
    end
  end

  def index
    @comments = Comment.all.order_desc
    @user = User.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = 'コメントを編集しました！'
      redirect_to(comment_index_path)
    else
      render(comment_edit_path(@current_user.id))
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:success] = 'コメントを削除しました！'
      redirect_to(comment_index_path)
    end
  end

  private
    def comment_params
      params.permit(:comment_content,:study_id)
    end
end
