RSpec.describe Web::Controllers::Articles::Create, type: :action do
  let(:action) { described_class.new }
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[article: { subject: 'Confident Ruby', content: 'Avdi Grimm' }] }

    it 'creates a new article' do
      action.call(params)
      article = repository.last

      expect(article.id).not_to be_nil
      expect(article.subject).to eq params.dig(:article, :subject)
    end

    it 'redirects the user to the articles listing' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/articles'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[article: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:article, :subject)).to eq ['is missing']
      expect(errors.dig(:article, :content)).to eq ['is missing']
    end
  end
end
