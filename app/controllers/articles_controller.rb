class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]
    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to articles_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end
    
    def update
        respond_to do |format|
            if @article.update(article_params)
                format.html { redirect_to article_url(@article), notice: "Article was sucessfully updated" }
                format.json { render :show, status: :ok, location: @article }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    # def delete
    #     @article.destroy

    #     respond_to do |format|
    #         format.html { redirect_to articles_index_url, notice: "Article was successfully destroyed."}
    #         format.json { head :no_content }
    #     end
    # end

    def destroy
        @article = Article.find(params["id"])
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
