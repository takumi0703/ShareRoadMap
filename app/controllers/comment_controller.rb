class CommentController < ApplicationController
  def index
    @comments = Comment.all
    @user = User.all
  end

  def show
  end

  def new
    @comment = Comment.new
    @study = Study.find(params[:study_id])
  end

  def create
    @comment = @current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'コメントを投稿しました！'
      redirect_to(comment_index_path)
    else
      render(comment_new_path)
    end
  end

  def edit
  end

  private
  def comment_params
    params.permit(:comment_content,:study_id)
  end
end
