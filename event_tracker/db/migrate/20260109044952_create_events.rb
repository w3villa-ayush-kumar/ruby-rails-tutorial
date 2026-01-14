class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :event_date

      t.timestamps
    end
  end
end
