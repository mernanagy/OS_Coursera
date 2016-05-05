class AddBdateToUser < ActiveRecord::Migration
  def change
    add_column :users, :bdate, :date
  end
end
