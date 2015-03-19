require_relative '../spec_helper'
describe 'Index Controller' do

    it 'Should get the / route' do
    get '/'
    expect(last_response).to be_ok
  end

    it 'Should verify that the response is a redirect' do
    post '/sea_lions'
    expect(last_response.body).to be_a(String)
    follow_redirect!
    expect(last_response).to be_ok
  end

    it 'Should verify redirect' do
    put '/edit/sea_lions'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
  end
    it 'Should verify a delete route' do
    delete '/delete/sea_lions'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
  end

end