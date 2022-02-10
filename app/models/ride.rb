class Ride < ApplicationRecord
  belongs_to :attraction
  belongs_to :user

  def take_ride
    provide_excuse.length > 6 ? provide_excuse : user.update_user(attraction)
  end

  private

  def not_enough_tickets?
    user.tickets < attraction.tickets
  end

  def not_tall_enough?
    user.height < attraction.min_height
  end

  def provide_excuse
    excuse = ['Sorry.']
    if not_enough_tickets?
      excuse <<
        " You do not have enough tickets to ride the #{attraction.name}."
    end
    if not_tall_enough?
      excuse << " You are not tall enough to ride the #{attraction.name}."
    end
    excuse.join('')
  end
end
