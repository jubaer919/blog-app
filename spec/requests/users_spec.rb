require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should be a successful response' do
      get '/users'
      expect(response).to have_http_status(200)
    end

    it 'should render the index page of users' do
      get '/users'
      expect(response).to render_template('users/index')
    end

    it 'should include the placeholder' do
      get '/users'
      expect(response.body).to include('here will be List of all users')
    end
  end

  describe 'GET / show' do
    it 'should be a successfull respose for specfic id' do
      get '/users/:id'
      expect(response).to have_http_status(200)
    end

    it 'should render the show page of users' do
      get '/users/:id'
      expect(response).to render_template(:show)
    end

    it 'should include the placeholder' do
      get '/users/:id'
      expect(response.body).to include('here will be a single users details')
    end
  end
end
