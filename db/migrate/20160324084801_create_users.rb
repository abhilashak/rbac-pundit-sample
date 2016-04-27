class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.integer :client_id
      t.boolean :in_active, null: false, default: false
      t.string  :type, default: 'User'
      t.hstore  :permissions, default: {}, null: false

      t.timestamps null: false
    end
  end
end
