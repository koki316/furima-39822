class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string       :items_name,     null:false
      t.text         :description,    null:false
      t.integer      :category_id,    null:false
      t.integer      :condition_id,   null:false
      t.integer      :pay_for_id,     null:false
      t.integer      :prefecture_id,  null:false
      t.integer      :ship_day_id,    null:false
      t.integer      :price,          null:false
      t.references   :user,           null:false, foreign_key: true 

      t.timestamps 

    end
  end
end
