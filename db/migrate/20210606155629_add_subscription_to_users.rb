class AddSubscriptionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :subscription, :decimal
  end
end
