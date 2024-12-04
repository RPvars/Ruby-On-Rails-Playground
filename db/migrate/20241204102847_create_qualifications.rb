class CreateQualifications < ActiveRecord::Migration[6.1]
  def change
    create_table :qualifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :level
      t.date :acquired_date
      t.date :valid_until
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
