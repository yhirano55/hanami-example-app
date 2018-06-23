require 'features_helper'

describe 'Add a article' do
  after do
    ArticleRepository.new.clear
  end

  it 'can create a new article' do
    visit '/articles/new'

    within 'form#article-form' do
      fill_in 'Subject', with: 'New article'
      fill_in 'Content', with: 'My Content'

      click_button 'Create'
    end

    expect(current_path).to eq '/articles'
    expect(page).to have_content 'New article'
  end
end
