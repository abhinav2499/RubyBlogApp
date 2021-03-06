class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit,:update,:show,:destroy]
    def index
        @article = Article.all
    end

    def new
        @article = Article.new
    end

    def show
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was updated!"
            redirect_to @article
        else
            flash[:success] = "Couldn't update the article!"
            render 'edit'
        end
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article.destroy
        flash[:success] = "Article was deleted!"
        redirect_to @article
    end

    private
        def article_params
            params.require(:article).permit(:title,:description)
        end

    def set_article
        @article = Article.find(params[:id])
        end
    end