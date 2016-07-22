class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :subdomain, limit: 50
      t.integer :owner_id

      t.timestamps
    end
    add_index :accounts, :subdomain, unique: true
  end
end
