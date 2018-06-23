RSpec.describe Web::Controllers::Articles::Index, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear

    @article = repository.create(subject: 'TDD', content: 'Kent Beck')
  end

  it 'is successful' do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'exposes all books' do
    action.call(params)
    expect(action.exposures[:articles]).to match_array [@article]
  end
end
