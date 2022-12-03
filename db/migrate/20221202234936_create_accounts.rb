class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.float :saldo, default: 0.0, null: false
      t.integer :number, null: false
      t.integer :agency, null: false
      t.integer :status, default: 1      
      t.timestamps
    end
  end
end
