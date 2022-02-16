class Airplane < ApplicationRecord
    has_many :flights
    validates :name, length: {minimum: 2}
    validates :total_rows, presence: true
    validates :total_columns, presence: true
end
