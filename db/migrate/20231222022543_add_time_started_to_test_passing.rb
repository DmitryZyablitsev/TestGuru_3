class AddTimeStartedToTestPassing < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passings, :time_started, :integer
    add_column :test_passings, :time_control, :integer
  end
end
