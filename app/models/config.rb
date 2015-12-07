class Config < ActiveRecord::Base
  attr_accessible :twilio_from_number, :twilio_secret, :twilio_sid
end
