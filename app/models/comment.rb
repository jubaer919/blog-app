class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  after_save :comments_counter

  def comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
