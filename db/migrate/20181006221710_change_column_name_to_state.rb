class ChangeColumnNameToState < ActiveRecord::Migration
  def change
    rename_column :users, :string, :state
  end
end
