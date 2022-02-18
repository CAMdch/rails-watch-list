class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where("list_id = #{params[:id].to_i}")
    @movies = @bookmarks.map do |bookmark|
      Movie.find(bookmark[:movie_id])
    end
  end
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
