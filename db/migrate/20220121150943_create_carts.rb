class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.boolean :accepted, default: false
      t.boolean :fulfilled, default: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
