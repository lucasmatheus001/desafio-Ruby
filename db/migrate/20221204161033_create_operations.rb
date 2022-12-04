class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.integer :kind
      t.float :value, null: false
      t.references :origin, null: true, foreign_key: { to_table: :accounts }
      t.references :destiny, null: true, foreign_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
