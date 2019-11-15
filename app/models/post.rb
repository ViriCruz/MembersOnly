class Post < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { in: 6..20 }
    validates :body, presence: true, length: { in: 15..300 }
    validates :user_id, presence: true
end
