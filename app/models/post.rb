class Post < ApplicationRecord
    belongs_to :user
    # validates :title, presence: true, length: { in: 1..20 }
    # validates :body, presence: true, length: { in: 1..300 }
    validates :user_id, presence: true
end
