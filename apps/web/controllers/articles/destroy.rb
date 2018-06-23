module Web::Controllers::Articles
  class Destroy
    include Web::Action

    def call(params)
      ArticleRepository.new.delete(params[:id])
      redirect_to routes.articles_path
    end
  end
end
