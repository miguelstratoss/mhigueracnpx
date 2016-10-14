class CreateExpenseTags < ActiveRecord::Migration
  def change
    create_table :expense_tags do |t|
      t.integer :expense_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
