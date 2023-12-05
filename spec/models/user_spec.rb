require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Name 1', posts_counter: 0) }

  before { user.save }

  it 'shoud be valid' do
    expect(user).to be_valid
  end

  it 'name should be present' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'posts_counter should be integer' do
    user.posts_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'posts_counter should be valid if posts_counter 1' do
    user.posts_counter = 1
    expect(user).to be_valid
  end

  it 'posts_counter should be posts_counter 0' do
    user.posts_counter = 0
    expect(user).to be_valid
  end

  it 'posts_counter should be posts_counter -1' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'posts_counter should be posts_counter mill' do
    user.posts_counter = nil
    expect(user).to_not be_valid
  end

  it 'returns most recent posts' do
    post1 = user.posts.create(title: 'post1', comments_counter: 0, likes_counter: 0)
    post2 = user.posts.create(title: 'post2', comments_counter: 0, likes_counter: 0)
    post3 = user.posts.create(title: 'post3', comments_counter: 0, likes_counter: 0)

    expect(user.most_recent_posts).to eq([post3, post2, post1])
  end
end
