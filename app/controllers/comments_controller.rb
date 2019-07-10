class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    create_comment = CreateComment.call(comment_params)
    if create_comment.success?
      flash[:success] = t('comment.comment_created')
    else
      flash[:danger] = t('comment.comment_failed_create')
    end
    redirect_to book_path(create_comment.book_id)
  end

  private

  def comment_params
    params.require(:comment).permit(%i[mark title description user_id book_id])
  end
end
