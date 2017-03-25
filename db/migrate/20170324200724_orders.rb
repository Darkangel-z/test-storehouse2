class Orders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :token
    end
  end
end
