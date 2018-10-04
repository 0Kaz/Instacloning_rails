class BookmarksController < ApplicationRecord
  before_action :authenticate_user!


  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    if @bookmark.save
      @post = @bookmark.post
      respond_to :js
    else
      flash[:alert] = "Something ain't working, bud! "
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @post = @bookmark.post
    if @bookmark.destroy
      respond_to :js
    else
      flash[:alert] = "Something ain't working, bud!"
    end
  end

  private

  def bookmark_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
