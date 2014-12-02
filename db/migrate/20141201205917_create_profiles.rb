class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true
      t.string :name
      t.string :address
      t.string :phone
      t.date :dob

      t.timestamps
    end
  end
end
