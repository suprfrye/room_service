require_relative '../spec_helper'

describe 'Index Controller' do

  it 'Should get the / route' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Max')
  end

  it 'Should get the /sea_lions route' do
    post '/sea_lions'
    expect(last_response).to be_redirect
    follow_redirect!
    expect(last_response).to be_ok
    expect(last_response.body).to include('Max')
  end

