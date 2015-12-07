class CreateConfigs < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :twilio_sid
      t.string :twilio_secret
      t.string :twilio_from_number

      t.timestamps
    end
  end
end
