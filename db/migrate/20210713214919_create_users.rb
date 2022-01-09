class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_fb, null: false
      t.string :email, null: false, default: ""
      t.string :username, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.integer :dni
      t.string :address
      t.date :birthday
      t.integer :unmsm_code
      t.integer :cicle
      t.date :registered_at
      t.references :area, null: true, foreign_key: true
      t.references :career, null: true, foreign_key: true
      t.integer :role
      t.integer :status

      t.timestamps null: false
    end
    
    add_index :users, :user_fb, unique: true
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
