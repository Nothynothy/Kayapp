class CommentsController < ApplicationController

  def new
    @topo = Topo.find(params[:topo_id])
    @comment = Comment.new
  end

  def create
    comment = Comment.new(params_comment)
    comment.active = true
    comment.category = 'alert'
    comment.user = current_user
    comment.topo = Topo
    raise
  end

  def update

  end

  private

  def params_comment
    params.require(:comment).permit(:alert_type, :severity, :description)
  end
end
