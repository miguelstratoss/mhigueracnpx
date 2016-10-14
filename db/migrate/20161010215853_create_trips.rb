class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :description
      t.date :init_date
      t.date :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
