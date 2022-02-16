class Flight < ApplicationRecord
    belongs_to :airplane 
    has_many :reservations
    has_many :users, through: :reservations

    validates :origin, presence: true
    validates :destination, presence: true
    validates :date, presence: true
    validates :airplane_id, presence: true
end
