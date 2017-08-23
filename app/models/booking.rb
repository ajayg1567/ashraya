class Booking < ActiveRecord::Base
  validate :booking_date_format


  before_save do |document|
    if document.breakfast && document.lunch && document.dinner
      document.booked = true
    end

  end

  before_update do |document|
    if document.breakfast && document.lunch && document.dinner
      document.booked = true
    end

  end


  protected

  def booking_date_format
    if booking_date < Date.today
      errors.add(:booking_date, "Booking date should greater or equal to today.")
    else
      return true
    end
  end
end
