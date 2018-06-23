module Web::Controllers::Articles
  class Create
    include Web::Action

    def call(params)
      ArticleRepository.new.create(params[:article])
      redirect_to '/articles'
    end
  end
end
