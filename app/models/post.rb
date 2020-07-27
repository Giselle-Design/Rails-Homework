class Post < ApplicationRecord

has_many(:comments, dependent: :destroy)

validates(:title, presence: true, uniqueness: true)
validates(:body, presence: {message: "can't be blank"}, length: {minimum: 10})

end
