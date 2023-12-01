class AddResultToTestPassings < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :result, :decimal, precision: 5, scale: 2, default: nil
  end
end
