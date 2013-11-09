class RemoveFieldFromAuthentication < ActiveRecord::Migration
  def change
    remove_column :authentications, :oauth, :string
  end
end
