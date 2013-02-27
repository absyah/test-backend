class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :user_handle
      t.integer :followers
      t.string :message
      t.float :sentiment
      t.integer :count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
