class CreateCarModels < ActiveRecord::Migration[6.0]
  def change
    create_table :car_models do |t|
      t.string :name
      t.integer :year
      t.string :manufacturer
      t.string :motorization
      t.string :fuel_type
      t.references :car_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
