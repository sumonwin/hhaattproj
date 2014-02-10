class CreateTravelfees < ActiveRecord::Migration
  def change
    create_table :travelfees do |t|
      t.integer :userid
      t.string :classname
      t.date :date
      t.integer :travel_fee

      t.timestamps
    end
  end
end
