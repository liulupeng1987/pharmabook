class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]

# GET /articles
  # GET /articles.json
  def index
    @articles = Article.rank(:row_order).all
  end

# GET /articles/1

  # GET /articles/1.json
  def show
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

end
