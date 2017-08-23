class DropBookingAndCreatNew < ActiveRecord::Migration
  def change
  	create_table :bookings do |t|

      t.timestamps null: false
      t.date :booking_date, :null => false 
      t.boolean :breakfast, :default => false # breakfast, lunch, dinner
      t.boolean :lunch, :default => false
      t.boolean :dinner, :default => false
      t.string  :breakfast_user_name 
      t.string :breakfast_phone
      t.string  :lunch_user_name 
      t.string :lunch_phone
      t.string  :dinner_user_name 
      t.string :dinner_phone
      t.boolean :booked, :default  => false
    end
  end
end
