# t.string :name
# t.integer :tickets
# t.integer :nausea_rating
# t.integer :happiness_rating
# t.integer :min_height

class Attraction < ApplicationRecord
  has_many :rides
  has_many :users, through: :rides
end
