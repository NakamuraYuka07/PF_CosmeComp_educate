class Users::CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    comment = current_user.comment.new(comment_params)
    comment.item = item.id
    comment.save
    redirect_to user_item_path(item)  
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to user_item_path(params[:item_id])
  end

  private

  def post_comment_params
    params.require(:comment).permit(:comment)
  end
end
