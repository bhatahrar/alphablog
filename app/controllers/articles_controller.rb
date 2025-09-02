class ArticlesController < ApplicationController
    def show 
        # byebug
        @article=Article.find(params[:id])
    end
    def index
        @articles=Article.all
    end 
    def new
        @article=Article.new
    end

    def create
        # byebug  
        @article=Article.new(params.require(:article).permit(:title,:description))
        # render plain:@article.inspect
            if @article.save
                flash[:notice]="Article was created successfully.."
        redirect_to article_path(@article)
        else 
            flash[:alert]="Article was not created.."
            render :new, status: :unprocessable_entity
        end
    end
    def edit
      
        @article=Article.find(params[:id])
    end
    def update
        @article=Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title,:description))
            flash[:notice]="Article has been successfully updated"
            redirect_to @article
        else 
            render :edit, status: :unprocessable_entity
        end
    end
end