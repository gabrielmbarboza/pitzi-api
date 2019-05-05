class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :device_model
      t.string :device_imei
      t.decimal :annual_price
      t.integer :installments
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
