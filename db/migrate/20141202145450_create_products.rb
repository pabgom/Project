class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :Name
      t.string :Description
      t.string :Img_url
      t.decimal :Price
      t.references :Category, index: true

      t.timestamps
    end
  end
end
