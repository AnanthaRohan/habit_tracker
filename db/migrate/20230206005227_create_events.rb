class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.date :date
      t.references :habit, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
