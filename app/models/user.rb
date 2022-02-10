# t.string "name"
# t.string "password_digest"
# t.integer "nausea"
# t.integer "happiness"
# t.integer "tickets"
# t.integer "height"
# t.boolean "admin", default: false

class User < ApplicationRecord
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def mood
    nausea > happiness ? 'sad' : 'happy'
  end

  def update_user(attraction)
    self.tickets = tickets - attraction.tickets
    self.nausea = nausea + attraction.nausea_rating
    self.happiness = happiness + attraction.happiness_rating
    save
  end
end
