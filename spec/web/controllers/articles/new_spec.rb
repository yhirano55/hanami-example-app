RSpec.describe Web::Controllers::Articles::New, type: :action do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Subject must be filled', 'Content must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/articles/new.html.slim') }
  let(:view)      { Web::Views::Articles::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    expect(rendered).to include 'There was a problem with your submission'
    expect(rendered).to include 'Subject must be filled'
    expect(rendered).to include 'Content must be filled'
  end
end
