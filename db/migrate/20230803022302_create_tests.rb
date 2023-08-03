class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1

      t.timestamps
    end
    add_reference :tests, :category, foreign_key: true, null: false
  end
end
