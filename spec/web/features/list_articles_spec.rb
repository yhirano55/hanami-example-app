require 'features_helper'

describe 'List articles' do
  let(:repository) { ArticleRepository.new }

  before do
    repository.clear

    repository.create(subject: 'PoEAA', content: 'Martin Fowler')
    repository.create(subject: 'TDD', content: 'Kent Beck')
  end

  it 'displays each article on the page' do
    visit '/articles'

    within '#articles' do
      expect(page.body).to have_css '.article'
    end
  end
end
