class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false, unique: true
      t.string :image_url, null: false, unique: true
      t.text :description, null: false
      t.string :rule, null: false
      t.string :argument, default: nil
      t.timestamps
    end
  end
end
