class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :good_id
      t.date :date
      t.decimal :total

      t.timestamps
    end
  end
end
