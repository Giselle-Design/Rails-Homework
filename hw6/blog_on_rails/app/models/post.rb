class Post < ApplicationRecord

has_many(:comments, dependent: :destroy)
belongs_to :user

validates(:title, presence: true, uniqueness: true)
validates(:body, presence: {message: "can't be blank"}, length: {minimum: 10})

end
