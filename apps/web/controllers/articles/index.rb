module Web::Controllers::Articles
  class Index
    include Web::Action

    expose :articles

    def call(params)
      @articles = ArticleRepository.new.all
    end
  end
end
