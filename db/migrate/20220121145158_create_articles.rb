class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :description_short
      t.decimal :sell_price
      t.string :centralcode
      t.string :description_categori_text
      t.text :description_search
      t.string :image_uri

      t.timestamps
    end
  end
end
