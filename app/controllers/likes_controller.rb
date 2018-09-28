class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :like_params, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(like_params)
    @post = @like.post
    if @like.save
      respond_to :js
    else
      flash[:alert] ="Youps! Something's missing here ..."
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    else
      flash[:alert] = "Youps ! We can't delete that ..."
    end
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
