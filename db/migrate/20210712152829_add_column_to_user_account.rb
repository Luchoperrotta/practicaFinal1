class AddColumnToUserAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :bal, :float
  end
end
