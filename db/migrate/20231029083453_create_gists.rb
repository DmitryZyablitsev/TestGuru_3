class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.references :question, foreign_key: true, null: false
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.string :url, null: false
      t.timestamps
    end
  end
end
