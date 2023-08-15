class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, presence: true, null: false, uniqueness: true

      t.timestamps
    end
  end
end
