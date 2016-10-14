class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.float :value
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
