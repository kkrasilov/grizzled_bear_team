class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :surname, null: false, default: ''
      t.string :login, index: { unique: true }
      t.string :email, index: { unique: true }
      t.boolean :admin, null: false, default: false
      t.boolean :team_member, null: false, default: false
      t.date    :birthday
      t.integer :height, null: :false, default: 0
      t.integer :weight, null: :false, default: 0
      t.string  :phone
      t.string  :gender, null: :false, default: :male
      
      t.timestamps
    end
  end
end
