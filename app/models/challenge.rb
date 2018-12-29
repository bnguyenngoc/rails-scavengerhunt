class Challenge < ApplicationRecord
    
    validates :title, presence: true
    validates :score, presence: true
end
