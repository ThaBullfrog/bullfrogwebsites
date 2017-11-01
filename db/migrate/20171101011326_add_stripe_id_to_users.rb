class AddStripeIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :stripe_id, :integer
    add_index :users, :stripe_id
  end
end
