class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    @list = List.find(@bookmark.list_id)
    redirect_to list_path(@list)
    # @bookmark = Bookmark.find(params[:id])
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
