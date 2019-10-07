class ArticlesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show
        @article = Article.find(params[:id])
        render json: @article
    end

    def index
        @articles = Article.all
        render json: @articles
    end

    def new
    end

    def create
        @article = Article.new(article_params)
        # @article = Article.new(params[:article])
 
        @article.save
        redirect_to @article
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end

end
