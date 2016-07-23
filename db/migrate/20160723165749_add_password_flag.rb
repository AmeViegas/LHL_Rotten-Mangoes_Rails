class AddPasswordFlag < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :temp_pw, :boolean, default: false
  end
end
