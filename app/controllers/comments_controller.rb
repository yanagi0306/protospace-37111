class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@prototype.id)
    else
      @user = @prototype.user
      @comments = @prototype.comments.includes(:user)
      render template:"prototypes/show"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:context).merge(user_id:current_user.id)
  end
end
