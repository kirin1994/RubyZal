class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :imie
      t.string :nazwisko
      t.integer :wiek
      t.string :ulica
      t.string :miasto
      t.integer :kod_pocztowy
      t.text :Informacje_dodatkowe

      t.timestamps
    end
  end
end
