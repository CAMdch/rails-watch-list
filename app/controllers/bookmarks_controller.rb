class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:id])
    @bookmark = @list.bookmarks.find_by(movie_id: @movie.id)
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
