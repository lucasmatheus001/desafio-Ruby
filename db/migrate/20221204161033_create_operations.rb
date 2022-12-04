class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.integer :kind
      t.references :origin_id, null: true, foreign_key: { to_table: :accounts }
      t.references :destiny_id, null: true, foreign_key: { to_table: :accounts }
      t.timestamps
    end
  end
end
