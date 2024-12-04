class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.string :time_slot
      t.boolean :is_available
      t.text :notes

      t.timestamps
    end
  end
end
