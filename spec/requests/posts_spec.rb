require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'should be response successull' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
    end

    it 'should render the posts index file' do
      get '/users/:id/posts'
      expect(response).to render_template(:index)
    end

    it 'should include the placeholder' do
      get '/users/:id/posts'
      expect(response.body).to include('here will be the list of all post')
    end
  end

  describe 'GET /show' do
    it 'should be a successfull response' do
      get '/users/:id/posts/:id'
      expect(response).to be_successful
    end

    it 'should render the posts show file' do
      get '/users/:id/posts/:id'
      expect(response).to render_template('posts/show')
    end

    it 'should include the placeholder' do
      get '/users/:id/posts/:id'
      expect(response.body).to include('here will be single post details')
    end
  end
end
