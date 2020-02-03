class Article < ApplicationRecord
    belongs_to :user #singular because "article has a user"
    validates :title, presence: true , length: {minimum: 3 , maximum: 50}
    validates :user_id, presence: true
end