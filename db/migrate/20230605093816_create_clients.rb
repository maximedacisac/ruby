class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :username
      t.string :lastname
      t.string :phone
      t.string :mail
      t.string :comment
      t.boolean :actif
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
