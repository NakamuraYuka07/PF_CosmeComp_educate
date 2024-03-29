class Users::CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = current_user.comments.new(comment_params)
    @comment.score = Language.get_data(comment_params[:comment])  #この行を追加
    @comment.item_id = @item.id
    @comment.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    Comment.find_by(id: params[:id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
