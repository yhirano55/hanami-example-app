require 'features_helper'

describe 'Visit home' do
  it 'is successful' do
    visit '/'

    expect(page.body).to include('Article')
  end
end
