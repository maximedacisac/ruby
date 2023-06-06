class AddSursiteToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :onSite, :boolean, default: true
    add_column :products, :etat, :string, default: "neuf"
    add_column :products, :deliveryDate, :date
  end
end
