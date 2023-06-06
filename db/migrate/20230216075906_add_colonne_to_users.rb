class AddColonneToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :tel, :string
    add_column :users, :comment, :text
    add_column :users, :role, :string, default: "Client"
    add_column :users, :archive, :boolean, default: false
  end
end
