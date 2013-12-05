class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, limit: 24

      t.timestamps
    end
  end
end
