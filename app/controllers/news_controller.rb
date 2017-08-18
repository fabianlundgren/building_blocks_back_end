class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def new
    binding.pry
    @building = Building.find(session[:current_building_id])
    @news = News.new
  end

  def create
    @news = News.new news_params
    if @news.save
      flash[:notice] = "News post created!"
      redirect_back(fallback_location: new_news_path)
    end
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update news_params
      flash[:notice] = "News post created!"
      redirect_back(fallback_location: new_news_path)
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
      flash[:notice] = "News post Deleted!"
      redirect_back(fallback_location: news_path)
    end
  end

  private

  def news_params
    params.require(:news).permit(:title, :description)
  end
end
