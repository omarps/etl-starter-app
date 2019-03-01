class CreateControls < ActiveRecord::Migration[5.2]
  def change
    create_table :controls do |t|
      t.string :guid
      t.string :kind
      t.integer :min_value
      t.integer :max_value
      t.boolean :deleted
      t.date :deleted_on
      t.string :requirements_text
      t.integer :applicable_discount_plans_count

      t.timestamps
    end
  end
end
