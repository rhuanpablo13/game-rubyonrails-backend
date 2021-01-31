class Monster < ApplicationRecord
    validates :id, presence: false
    validates :name, presence: true
end
