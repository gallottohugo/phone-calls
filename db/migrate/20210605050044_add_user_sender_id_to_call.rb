class AddUserSenderIdToCall < ActiveRecord::Migration[6.1]
  def change
    add_reference :calls, :user_sender, foreign_key: { to_table: :users }
  end
end
