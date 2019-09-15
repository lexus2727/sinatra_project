class CreateTreks < ActiveRecord::Migration[4.2]
  def change
    create_table :treks do |t|
      t.string :name
      t.string :location
      t.integer :user_id
    end
  end
end
