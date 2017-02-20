class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      
      t.text :content
      t.integer :user_id
      t.integer :receiver

      t.timestamps null: false
    end
  end
end
