class AddAccountTypeToUsers < ActiveRecord::Migration
  def change
    change_column :users, :account_type, :string, default: 'basic' 
  end
end
