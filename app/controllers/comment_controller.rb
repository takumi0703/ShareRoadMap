class CommentController < ApplicationController
  before_action :autheniticate_user, { only: %i[new edit update destroy] }
  before_action :not_set_current_user_comment, { only: [:edit] }
  before_action :set_comment, { only: %i[show edit update destroy] }
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
    @comments = Comment.all.order_desc.preload(:user, { study: :taggings })
    @user = User.all
  end

  def show; end

  def edit; end

  def update
    @comment.update(comment_params)
    if @comment.save
      flash[:success] = 'コメントを編集しました！'
      redirect_to(comment_index_path)
    else
      flash[:alert] = 'コメントに不備があります'
      redirect_to(comment_edit_path(@comment.id))
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'コメントを削除しました！'
      redirect_to(comment_index_path)
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.permit(:comment_content, :study_id)
  end
end
