class AddCountryIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :country, null: false, foreign_key: true
  end
end
