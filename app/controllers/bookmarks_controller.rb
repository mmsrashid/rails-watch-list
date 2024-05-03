class BookmarksController < ApplicationController

  before_action :set_list
  before_action :set_bookmark, only: [:create, :destroy]

  # Action to render form for creating a new bookmark
  def new
    @bookmark = @list.bookmarks.new
  end

  # Action to create a new bookmark
  def create
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # Action to delete a bookmark
  def destroy
    @bookmark.destroy
    redirect_to @list, notice: 'Bookmark was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = @list.bookmarks.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end

end
