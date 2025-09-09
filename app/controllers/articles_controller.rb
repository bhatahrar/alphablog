class ArticlesController < ApplicationController
    before_action :set_article,only: [:show,:edit,:update,:destroy]
    def show 
        # byebug
    end
    def index
        @articles=Article.all
    end 
    def new
        @article=Article.new
    end 

    def create
        # byebug  
        @article=Article.new(article_params)
        # render plain:@article.inspect
            if @article.save
                flash[:notice]="Article was created successfully.."
        redirect_to articles_path
        else 
            flash[:alert]="Article was not created.."
            render :new, status: :unprocessable_entity
        end
    end
    def edit
      
    end
    def update
        if @article.update(article_params)
            flash[:notice]="Article has been successfully updated"
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end
    private
    def set_article
        @article=Article.find(params[:id])
    end
    private
    def article_params
        params.require(:article).permit(:title,:description)
    end
end