class CreateCartitems < ActiveRecord::Migration[7.0]
  def change
    create_table :cartitems do |t|
      t.references :article, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.boolean :fulfilled
      t.decimal :price_ordered
      t.decimal :quantity_ordered
      t.decimal :quantity_prepared

      t.timestamps
    end
  end
end
