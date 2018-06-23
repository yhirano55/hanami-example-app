module Web::Controllers::Articles
  class Create
    include Web::Action

    expose :article

    params do
      required(:article).schema do
        required(:subject).filled(:str?)
        required(:content).filled(:str?)
      end
    end

    def call(params)
      if params.valid?
        ArticleRepository.new.create(params[:article])
        redirect_to routes.articles_path
      else
        self.status = 422
      end
    end
  end
end
