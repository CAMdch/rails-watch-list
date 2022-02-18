class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy edit]
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
    @bookmarks = Bookmark.where("list_id = #{params[:id].to_i}")
    @movies = @bookmarks.map do |bookmark|
      Movie.find(bookmark[:movie_id])
    end
    @reviews = @list.reviews
    @review = Review.new
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  def edit
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
