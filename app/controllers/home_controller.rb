class HomeController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  # GET /homes
  # GET /homes.json
  def index
    
  end

  def about_us

  end
  def contact_us

  end
  def sponsor_meal
    bookings=Booking.where("booking_date >= ? AND booking_date <= ?",Date.today,Date.today.end_of_year)
    dates_details = {}
    dates = []
    bookings.each do |b|
      temp = {:breakfast => b.breakfast,:lunch => b.lunch,:dinner => b.dinner,:booked => b.booked}
      dates_details[b.booking_date.strftime("%Y/%m/%d")] = temp
      dates.push b.booking_date.strftime("%Y/%m/%d")

    end
    gon.dates_details = dates_details
    gon.dates = dates
  end
  def gallery

  end
  def partners

  end

  def get_booking_details
    sleep(5.seconds)
    data = {:success => true}
    respond_with data , :location => nil
  end
end
