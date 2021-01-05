class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_of_birth
      t.string :birthplace

      t.timestamps
    end
  end
end
