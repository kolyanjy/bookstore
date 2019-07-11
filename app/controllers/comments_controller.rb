class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    result = Comments::CreateComment.call(params: comment_params, current_user: current_user, book_id: params[:book_id])
    if result.success?
      flash[:success] = t('comment.comment_created')
    else
      flash[:danger] = t('comment.comment_failed_create')
    end
    redirect_to book_path(result.comment.book_id)
  end

  private

  def comment_params
    params.require(:comment).permit(%i[mark title description])
  end
end
