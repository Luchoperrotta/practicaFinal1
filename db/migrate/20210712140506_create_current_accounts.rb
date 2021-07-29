class CreateCurrentAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :current_accounts do |t|
      t.references :user_account, null: false, foreign_key: true
      t.datetime :date
      t.string :description
      t.float :debit
      t.float :credit
      t.float :balance

      t.timestamps
    end
  end
end
