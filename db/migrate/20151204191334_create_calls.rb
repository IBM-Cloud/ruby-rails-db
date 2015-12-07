class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
