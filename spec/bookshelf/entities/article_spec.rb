RSpec.describe Article, type: :entity do
  it 'can be initialized with attributes' do
    article = Article.new(subject: 'MyArticle', content: "MyContent")
    expect(article.subject).to eq 'MyArticle'
  end
end
