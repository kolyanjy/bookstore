class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @created_comment = CreateComment.call()
  end

  private

  
end
