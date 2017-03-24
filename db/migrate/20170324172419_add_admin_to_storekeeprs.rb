class AddAdminToStorekeeprs < ActiveRecord::Migration[5.0]
  def change
    add_column :storekeepers, :admin, :boolean, default: false
  end
end
