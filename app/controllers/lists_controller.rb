class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list: @list)
    @movies_arr = @bookmarks.map { |bookmark| bookmark.movie_id }
    @movies = @movies_arr.map { |id| Movie.find(id) }
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(review_params)
    if @list.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:list).permit(:name)
  end
end
