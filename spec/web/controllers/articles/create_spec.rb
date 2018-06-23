RSpec.describe Web::Controllers::Articles::Create, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[article: { subject: 'Confident Ruby', content: 'Avdi Grimm' }] }
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear
  end

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
