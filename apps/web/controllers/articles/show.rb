module Web::Controllers::Articles
  class Show
    include Web::Action

    expose :article

    def call(params)
      @article = ArticleRepository.new.find(params[:id])
    end
  end
end
