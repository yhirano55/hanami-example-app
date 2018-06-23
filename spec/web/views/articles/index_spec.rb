RSpec.describe Web::Views::Articles::Index, type: :view do
  let(:exposures) { Hash[articles: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/articles/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #articles' do
    expect(view.articles).to eq exposures.fetch(:articles)
  end

  describe 'when there are no articles' do
    it 'shows a placeholder message' do
      expect(rendered).to include '<p class="placeholder">There are no articles yet.</p>'
    end
  end

  describe 'when there are articles' do
    let(:article1) { Article.new(subject: 'Refactoring', content: 'Martin Fowler') }
    let(:article2) { Article.new(subject: 'Domain Driven Design', content: 'Eric Evans') }
    let(:exposures) { Hash[articles: [article1, article2]] }

    it 'lists them all' do
      expect(rendered.scan(/class="article"/).count).to eq 2
      expect(rendered).to include 'Refactoring'
      expect(rendered).to include 'Domain Driven Design'
    end

    it 'hides the placeholder message' do
      expect(rendered).not_to include '<p class="placeholder">There are no articles yet.</p>'
    end
  end
end
