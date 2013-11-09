class AddColsToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :oauth, :string
    add_column :authentications, :oauth_secret, :string
  end
end
