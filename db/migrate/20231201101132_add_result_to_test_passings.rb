class AddResultToTestPassings < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :result, :decimal, precision: 5, scale: 2, default: nil
    add_column :test_passings, :successful, :boolean, default: false
    remove_column :test_passings, :passing_status, :string
    add_column :test_passings, :passed, :boolean, default: false
  end
end
