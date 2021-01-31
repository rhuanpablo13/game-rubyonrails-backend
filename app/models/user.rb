class User < ApplicationRecord
    validates :id, presence: false
    validates :name, presence: true
end
