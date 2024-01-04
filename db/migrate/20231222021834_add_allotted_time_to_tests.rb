class AddAllottedTimeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :allotted_time, :integer
  end
end
